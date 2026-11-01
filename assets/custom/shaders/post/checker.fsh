#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

const int SIZE = 80;

void main(){

    vec2 coord = texCoord;

    bool x = int(gl_FragCoord.x) % (SIZE*2) >= SIZE;
    bool y = int(gl_FragCoord.y) % (SIZE*2) >= SIZE;
    if((x && !y) || (y && !x)) {
        coord.y = 1-texCoord.y;
    }

    fragColor = texture(InSampler, coord);
}
