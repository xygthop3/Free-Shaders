//
// Wave fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_wave_time;
uniform float uni_wave_amount;
uniform float uni_wave_distortion;
uniform float uni_wave_speed;

void main()
{ 
    vec2 uv = v_vTexcoord;
    uv.x = uv.x + cos(uv.y * uni_wave_amount + uni_wave_time * uni_wave_speed) / uni_wave_distortion;
    uv.y = uv.y + sin(uv.x * uni_wave_amount + uni_wave_time * uni_wave_speed) / uni_wave_distortion;
 
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, uv);
}