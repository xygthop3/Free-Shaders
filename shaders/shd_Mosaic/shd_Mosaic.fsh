//
// Mosaic fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_mosaic_resolution;
uniform float uni_mosaic_pixel_amount;

void main()
{
	vec2 res = vec2(1.0, uni_mosaic_resolution.x/uni_mosaic_resolution.y);
    vec2 size = vec2(res.x/uni_mosaic_pixel_amount, res.y/uni_mosaic_pixel_amount);
    vec2 UV = v_vTexcoord - mod(v_vTexcoord, size);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, UV );
}
