#version 330

#moj_import <custom:data_storage.glsl>

#define PI 3.141592

float getAnimationProgress(sampler2D timerSampler) {
    return decodeFloat(texture(timerSampler, vec2(0.25, 0.5)));
}


// Easings taken from easings.net -- GPL 3.0 License

// Sine
float easeInSine(float x) { 
    return 1.0 - cos((x * PI) / 2.0); 
}
float easeOutSine(float x) { 
    return sin((x * PI) / 2.0); 
}
float easeInOutSine(float x) { 
    return -(cos(PI * x) - 1.0) / 2.0; 
}

// Quadratic
float easeInQuad(float x) { 
    return x * x; 
}
float easeOutQuad(float x) { 
    return 1.0 - (1.0 - x) * (1.0 - x); 
}
float easeInOutQuad(float x) { 
    return x < 0.5 ? 2.0 * x * x : 1.0 - pow(-2.0 * x + 2.0, 2.0) / 2.0; 
}

// Cubic
float easeInCubic(float x) { 
    return x * x * x; 
}
float easeOutCubic(float x) { 
    return 1.0 - pow(1.0 - x, 3.0); 
}
float easeInOutCubic(float x) { 
    return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2; 
}

// Back
float easeInBack(float x) {
    float c1 = 1.70158;
    float c3 = c1 + 1.0;
    return c3 * x * x * x - c1 * x * x;
}
float easeOutBack(float x) {
    float c1 = 1.70158;
    float c3 = c1 + 1;
    return 1 + c3 * pow(x - 1, 3) + c1 * pow(x - 1, 2);
}
float easeInOutBack(float x) {
    float c1 = 1.70158;
    float c2 = c1 * 1.525;

    return x < 0.5
    ? (pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
    : (pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
}

// Elastic
float easeOutElastic(float x) {
    float c4 = (2.0 * PI) / 3.0;

    return x == 0
        ? 0
        : x == 1
        ? 1
        : pow(2.0, -10.0 * x) * sin((x * 10.0 - 0.75) * c4) + 1.0;
}

// Bounce
float easeOutBounce(float x) {
    float n1 = 7.5625;
    float d1 = 2.75;

    if (x < 1 / d1) {
        return n1 * x * x;
    } else if (x < 2 / d1) {
        return n1 * (x -= 1.5 / d1) * x + 0.75;
    } else if (x < 2.5 / d1) {
        return n1 * (x -= 2.25 / d1) * x + 0.9375;
    } else {
        return n1 * (x -= 2.625 / d1) * x + 0.984375;
    }
}