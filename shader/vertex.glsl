precision mediump float;
attribute float aRandom;

uniform float uTime;
uniform vec2 uFrequency;

varying vec2 vUv;
varying float vElevation;

//varying float vRandom;

void main(){
    vec4 modelPosition=modelMatrix*vec4(position,1.);
    // modelPosition.z+=aRandom*0.2;
    float elevation=sin(modelPosition.x*uFrequency.x-uTime)*.1;
    elevation+=sin(modelPosition.y*uFrequency.y-uTime)*.1;
    modelPosition.z+=elevation;
    vec4 viewPosition=viewMatrix*modelPosition;
    vec4 projectedPosition=projectionMatrix*viewPosition;
    gl_Position=projectedPosition;
    vUv=uv;
    vElevation=elevation;
    // vRandom = aRandom;
}