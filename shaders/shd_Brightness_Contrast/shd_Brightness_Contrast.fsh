//
// Brightness Contrast fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_brightness_amount;
uniform float uni_contrast_amount;

void main()
{
	vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = v_vColour * vec4( (colour.rgb+uni_brightness_amount) * (1.0+uni_contrast_amount)/1.0, colour.a);
}