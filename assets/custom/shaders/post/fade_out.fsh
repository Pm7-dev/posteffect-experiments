#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <custom:animation.glsl>

uniform sampler2D InSampler;
uniform sampler2D TimerSampler;

in vec2 texCoord;


out vec4 fragColor;

void main(){
    float pos = getAnimationProgress(TimerSampler);

    vec4 color = texture(InSampler, texCoord);

    fragColor = mix(color, vec4(0.0, 0.0, 0.0, 1.0), pos);
}
