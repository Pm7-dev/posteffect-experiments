#version 330

#moj_import <custom:animation.glsl>

uniform sampler2D InSampler;
uniform sampler2D TimerSampler;
uniform sampler2D SwapSampler;

in vec2 texCoord;

out vec4 fragColor;

void main(){
    float progress = getAnimationProgress(TimerSampler);

    if(progress <= 0.05) {
        fragColor = texture(InSampler, texCoord);
    } else {
        fragColor = texture(SwapSampler, texCoord);
    }
}
