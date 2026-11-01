#version 330


#moj_import <custom:animation.glsl>

uniform sampler2D InSampler;
uniform sampler2D Frame3Sampler;
uniform sampler2D Frame4Sampler;
uniform sampler2D Frame5Sampler;
uniform sampler2D Frame6Sampler;
uniform sampler2D Frame7Sampler;
uniform sampler2D Frame8Sampler;
uniform sampler2D Frame9Sampler;
uniform sampler2D Frame10Sampler;
uniform sampler2D Frame11Sampler;
uniform sampler2D Frame12Sampler;
uniform sampler2D Frame13Sampler;

in vec2 texCoord;

out vec4 fragColor;

void main(){
    int frame = int(getAnimationProgress(InSampler) * 20.0);


    // DO NOT DO THIS THE WAY I DID!!!
    // Instead of having a sampler for each frame of an animation, you should instead use a single sampler and a texture atlas. This is much more efficient and will allow you to have more frames in your animation without having to add more samplers.
    // I think there's a hard limit of 12 samplers or something lol
    switch(frame) {
        case 0:
            fragColor = texture(Frame3Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 1:
            fragColor = texture(Frame4Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 2:
            fragColor = texture(Frame5Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 3:
            fragColor = texture(Frame6Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 4:
            fragColor = texture(Frame7Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 5:
            fragColor = texture(Frame8Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 6:
            fragColor = texture(Frame9Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 7:
            fragColor = texture(Frame10Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 8:
            fragColor = texture(Frame11Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 9:
            fragColor = texture(Frame12Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        case 10:
            fragColor = texture(Frame13Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
            break;
        default:
            fragColor = texture(Frame13Sampler, vec2(texCoord.x, (texCoord.y * -1.0) + 1.0));
    }
}
