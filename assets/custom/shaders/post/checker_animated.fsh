#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

void main(){

    int SIZE = int(sin(GameTime * 1200.0 * 3.1415 * 5.0)*100. + 120.0);

    vec2 coord = texCoord;

    bool x = abs(int(gl_FragCoord.x - ScreenSize.x/2.0)) % (SIZE*2) >= SIZE;
    bool y = abs(int(gl_FragCoord.y - ScreenSize.y/2.0)) % (SIZE*2) >= SIZE;
    if((x && !y) || (y && !x)) {
        coord.y = 1-texCoord.y;
    }

    fragColor = texture(InSampler, coord);
}
