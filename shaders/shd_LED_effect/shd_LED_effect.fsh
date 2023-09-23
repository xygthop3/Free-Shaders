//
// LED Effect fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_resolution;
uniform float uni_led_size;
uniform float uni_led_brightness;  

float PI = 3.1415;

vec4 pixelize(vec2 UV, float Scale) {
    float dx = 1.0/Scale;
    float dy = 1.0/Scale;
    vec2 newUV = vec2(dx*ceil(UV.x/dx),dy*ceil(UV.y/dy));
    return texture2D(gm_BaseTexture, newUV);
}

void main()
{
    vec2 coor = v_vTexcoord * uni_led_size;
    coor.x *= (uni_resolution.x/uni_resolution.y);
     
    vec4 resultColor = pixelize(v_vTexcoord, uni_led_size) * uni_led_brightness;
    
    float mvx = abs(sin(coor.x*PI))*1.5;
    float mvy = abs(sin(coor.y*PI))*1.5;
    
    if (mvx*mvy < 1.0) {
      resultColor=vec4(0.0,0.0,0.0,texture2D(gm_BaseTexture, v_vTexcoord).a);
    }
    else {
      resultColor = resultColor*(mvx*mvy);
    }
    
    gl_FragColor = v_vColour * resultColor;
}
