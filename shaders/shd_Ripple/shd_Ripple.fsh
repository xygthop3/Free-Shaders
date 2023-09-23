//
// Ripple fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_ripple_time;
uniform vec2 uni_ripple_mouse_pos;
uniform vec2 uni_ripple_resolution;
uniform float uni_ripple_wave_amount;
uniform float uni_ripple_wave_distortion;
uniform float uni_ripple_wave_speed;

void main()
{ 
    vec2 uv = v_vTexcoord;
    uv.x *= (uni_ripple_resolution.x/uni_ripple_resolution.y);
	
    float centre_x = (uni_ripple_mouse_pos.x / uni_ripple_resolution.x) * (uni_ripple_resolution.x/uni_ripple_resolution.y);
    float centre_y = uni_ripple_mouse_pos.y / uni_ripple_resolution.y;
  
    vec2 dir = v_vTexcoord - vec2(0.5);
    float dist = distance(uv, vec2(centre_x,centre_y));
    vec2 offset = dir * (sin(dist * uni_ripple_wave_amount - uni_ripple_time * uni_ripple_wave_speed)) / uni_ripple_wave_distortion;
	
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
}
