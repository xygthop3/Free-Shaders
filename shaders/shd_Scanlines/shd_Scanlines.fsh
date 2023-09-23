//
// Scanlines fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_scanlines_resolution;
  
void main()
{

    vec4 colour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float half_y = v_vTexcoord.y * uni_scanlines_resolution.y * 0.5;
    float delta = floor(half_y) - half_y;
    if (delta * delta < 0.1) { colour.rgb = vec3(0.0); }
   
    gl_FragColor = colour;
}
