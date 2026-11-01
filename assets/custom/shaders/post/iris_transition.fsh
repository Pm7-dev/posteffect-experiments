#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <custom:animation.glsl>

uniform sampler2D InSampler;
uniform sampler2D TimerSampler;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

in vec2 texCoord;

out vec4 fragColor;

void main(){
    float pos = getAnimationProgress(TimerSampler);

    vec2 loc = texCoord * InSize;

    float radius;
    if(pos < 0.3) {
        radius = 1.0 - easeOutBounce(pos*(1.0/0.3));
    } else if(pos < 0.6) {
        radius = 0.0;
    } else if(pos < 0.9){
        radius = easeOutBounce((pos-0.6) * (1.0/0.3));
    } else {
        radius = 1.0;
    }
    float halfX = InSize.x/2.0;
    float halfY = InSize.y/2.0;
    radius *= sqrt(halfX*halfX + halfY*halfY);

    vec2 center = InSize/2.0;
    float dist = distance(loc, center) - radius;
    vec4 color = vec4(0.0, 0.0, 0.0, 1.0);
    if(dist <= 0.0) {
        color = texture(InSampler, texCoord);
    } 


    fragColor = color;
}
