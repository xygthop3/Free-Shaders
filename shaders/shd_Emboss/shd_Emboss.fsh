//
// Emboss fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_resolution;

void main()
{ 
    vec2 onePixel = vec2(1.0 / uni_resolution.x, 1.0 / uni_resolution.y);
    vec2 uv = v_vTexcoord;
    
    vec3 colour = vec3(0.5);
    colour -= texture2D(gm_BaseTexture, uv - onePixel).rgb;
    colour += texture2D(gm_BaseTexture, uv + onePixel).rgb;
    colour.rgb = vec3((colour.r + colour.g + colour.b) / 3.0);
    
    gl_FragColor = v_vColour * vec4(colour.rgb, texture2D(gm_BaseTexture,uv).a);
}
