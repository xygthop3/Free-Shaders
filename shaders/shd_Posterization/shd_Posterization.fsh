//
// Posterization fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_Posterization_gamma;
uniform float uni_Posterization_num_colors;

void main()
{
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 col = color.rgb;
      col = pow(abs(col), vec3(uni_Posterization_gamma));
      col = col * uni_Posterization_num_colors;
      col = floor(col);
      col = col / uni_Posterization_num_colors;
      col = pow(abs(col), vec3(1.0/uni_Posterization_gamma));
    gl_FragColor = vec4(col, color.a);
}
