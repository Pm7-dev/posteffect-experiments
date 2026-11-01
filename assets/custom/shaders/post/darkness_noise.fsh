#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void main(){

    vec2 coord = round(texCoord * 500) / 500.0;
    vec4 color = texture(InSampler, texCoord);
    vec4 noise = vec4(vec3(random(coord + GameTime)), 1.0);
    float brightness = (0.2126*color.r + 0.7152*color.g + 0.0722*color.b);
    float p = 1.0 - min(brightness/0.7, 1.0);

    if(noise.r < p*p*p*p) {
        noise = vec4(vec3(1.0) * (brightness - 0.35), 1.0);
    } else {
        noise = color;
    }


    fragColor = mix(noise, color, brightness);
}
