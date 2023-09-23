//
// Shockwave fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uni_shockwave_time;
uniform vec2 uni_shockwave_mouse_pos;
uniform vec2 uni_shockwave_resolution;
uniform float uni_shockwave_amplitude;
uniform float uni_shockwave_refraction;
uniform float uni_shockwave_width;

void main()
{ 
    vec2 uv = v_vTexcoord;
    uv.x *= (uni_shockwave_resolution.x/uni_shockwave_resolution.y);
    
    vec2 texCoord = v_vTexcoord;  
    
    float centre_x = (uni_shockwave_mouse_pos.x / uni_shockwave_resolution.x) * (uni_shockwave_resolution.x/uni_shockwave_resolution.y);
    float centre_y = uni_shockwave_mouse_pos.y / uni_shockwave_resolution.y;
  
    float dist = distance(uv, vec2(centre_x,centre_y));
    
    if ( (dist <= (uni_shockwave_time + uni_shockwave_width)) && (dist >= (uni_shockwave_time - uni_shockwave_width)) ) 
    {
        float dif = (dist - uni_shockwave_time); 
        float powDiff = 1.0 - pow(abs(dif*uni_shockwave_amplitude), uni_shockwave_refraction); 
        float diffTime = dif  * powDiff;
        vec2 diffUV = normalize(uv - uni_shockwave_mouse_pos); 
        texCoord = uv + (diffUV * diffTime);
        texCoord.x *= (uni_shockwave_resolution.y/uni_shockwave_resolution.x);
    } 
 
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, texCoord);
}