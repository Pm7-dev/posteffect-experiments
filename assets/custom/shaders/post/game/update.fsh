#version 330

#moj_import <minecraft:globals.glsl>
#moj_import <custom:data_storage.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

const float RESET_THRESHOLD_SECONDS = 0.5;

layout(std140) uniform TimerConfig {
    float seconds;
};

void main(){

    // Decode previous GameTime from the buffer
    float lastGameTime = decodeFloat(texture(InSampler, vec2(0.75, 0.5)));

    
    // The first frame will have zero color in the buffer, so we need to initialize the data by writing the current GameTime.
    if(lastGameTime == 0.0) {
        if(texCoord.x < 0.5) return;
        fragColor = encodeFloat(GameTime);
        return;
    }

    float delta = GameTime - lastGameTime; // Change in GameTime since the last frame update
    if(delta < 0) delta += 1.0; // if GameTime loops back to 0, prevent the animation from going back.
    float deltaSeconds = delta * 1200.0; // 1 GameTime is 20 minutes, which is 1200 seconds

    /* If the delta is way too large, the shader has likely been disabled and then reenabled, meaning the
       animation should be reset. */
    if(deltaSeconds > RESET_THRESHOLD_SECONDS) {
        if(texCoord.x < 0.5) {
            // Set animation progress to zero.
            fragColor = vec4(0.0, 0.0, 0.0, 0.0);
        } else {
            // Update the last GameTime to the current GameTime.
            fragColor = encodeFloat(GameTime);
        }
        return;
    }

    float deltaSteps = deltaSeconds / seconds; // How many steps have passed since the last update

    if(texCoord.x < 0.5) {
        // Update the animation progress based on the deltaSteps
        float newProgress = decodeFloat(texture(InSampler, vec2(0.25, 0.5))) + deltaSteps;
        if(newProgress > 1.0) newProgress = 1.0;
        fragColor = encodeFloat(newProgress);
    } else {
        // Update the last GameTime to the current GameTime.
        fragColor = encodeFloat(GameTime);
    }
}
