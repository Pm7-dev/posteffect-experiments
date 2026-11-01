#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

void main(){

    vec2 coord = texCoord;
    if(int(texCoord.x * 20) % 2 >= 1) coord.y = 1.0 - texCoord.y;

    fragColor = texture(InSampler, coord);
}
