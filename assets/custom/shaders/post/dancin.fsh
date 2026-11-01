#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

const float BPM = 165.0;


// gleefully stolen from someone smarter than me
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() {

    float hue = mod(floor(1.0/(GameTime * 20.0 * BPM) * 8.0) / 8.0, 1.0);

    vec4 color = texture(InSampler, texCoord);
    color.rgb = rgb2hsv(color.rgb);
    color.r = floor(mod((GameTime * 20.0 * BPM), 8.0)) / 8.0;
    color.rgb = hsv2rgb(color.rgb);

    fragColor = color;
}
