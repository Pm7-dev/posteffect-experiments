#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <custom:animation.glsl>

uniform sampler2D InSampler;
uniform sampler2D TimerSampler;

in vec2 texCoord;

out vec4 fragColor;

const vec2 rShift = vec2(2.0, 1.0);
const vec2 gShift = vec2(-2.0, 1.0);
const vec2 bShift = vec2(0.0, -2.0);

const float amnt = 0.008;

void main(){
    float dist = getAnimationProgress(TimerSampler) * amnt;

    float rCol = texture(InSampler, texCoord + (rShift * dist)).r;
    float gCol = texture(InSampler, texCoord + (gShift * dist)).g;
    float bCol = texture(InSampler, texCoord + (bShift * dist)).b;
    fragColor = vec4(rCol, gCol, bCol, 1.0);
}
