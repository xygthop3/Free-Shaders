//
// Grayscale fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_grayscale_amount;

void main()
{
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	float gray = dot(color.rgb, vec3(0.21, 0.71, 0.07));
    gl_FragColor = vec4(mix(color.rgb, vec3(gray), uni_grayscale_amount), color.a);
}
