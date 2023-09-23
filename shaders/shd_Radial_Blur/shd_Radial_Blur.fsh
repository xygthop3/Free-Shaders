//
// Radial Blur fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform vec2 uni_radial_mouse_pos;
uniform vec2 uni_radial_resolution;
uniform float uni_radial_blur_offset;
uniform float uni_radial_brightness;

const float blur_amount = 30.0; //This should be a uniform??? 

void main()
{
    vec2 uv = v_vTexcoord;
    vec2 radial_size = vec2(1.0/uni_radial_resolution);
    radial_size.x *= (uni_radial_resolution.x/uni_radial_resolution.y);
    vec2 radial_origin = vec2(uni_radial_mouse_pos/uni_radial_resolution);
    vec4 colour = vec4(0.0);
       
    uv += radial_size * 0.5 - radial_origin;
 
    for (float i = 0.0; i < blur_amount; i++) {
        float offset = 1.0-uni_radial_blur_offset * (i / (blur_amount - 1.0));
        colour += texture2D(gm_BaseTexture, uv * offset + radial_origin);  
    }
 
  gl_FragColor = v_vColour * colour / (blur_amount - 1.0) * uni_radial_brightness;
}
