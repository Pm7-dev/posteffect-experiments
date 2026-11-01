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
    fragColor = vec4(vec3(random(coord + GameTime)), 1.0);
}
