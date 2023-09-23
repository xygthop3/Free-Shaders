//
// Refraction fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D samp_normalMap;
uniform sampler2D samp_diffuseTex;

uniform vec2 uni_refraction_resolution;
uniform vec2 uni_refraction_textureRes;
uniform vec3 uni_refraction_texturePos;

void main()
{   
    vec2 imagePos = v_vTexcoord - (uni_refraction_texturePos.xy / uni_refraction_resolution);
    vec2 aspectRatio = uni_refraction_resolution / uni_refraction_textureRes;
    vec2 ssUVs = imagePos * aspectRatio;

    vec2 normalMap = texture2D(samp_normalMap, ssUVs).xy * 2.0 - 1.0;
	vec2 offset = v_vTexcoord + normalMap * uni_refraction_texturePos.z;
   
    gl_FragColor = v_vColour * texture2D(samp_diffuseTex, ssUVs) * texture2D(gm_BaseTexture, offset.xy);
}