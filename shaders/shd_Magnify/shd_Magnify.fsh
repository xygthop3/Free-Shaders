//
// Magnify fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_magnify_mouse_pos;
uniform vec2 uni_magnify_resolution;

uniform float uni_magnify_circleRadius;// 0.25 0.4 0.6
uniform float uni_magnify_minZoom;
uniform float uni_magnify_maxZoom;

void main()
{ 
    vec4 base_texture = texture2D(gm_BaseTexture, v_vTexcoord);
    
	vec2 UV = v_vTexcoord;
    UV.x *= (uni_magnify_resolution.x/uni_magnify_resolution.y);
    float centre_x = (uni_magnify_mouse_pos.x / uni_magnify_resolution.x) * (uni_magnify_resolution.x/uni_magnify_resolution.y);
    float centre_y = uni_magnify_mouse_pos.y / uni_magnify_resolution.y;
  
    float maxX = centre_x + uni_magnify_circleRadius;
    float minX = centre_x - uni_magnify_circleRadius;
    float maxY = centre_y + uni_magnify_circleRadius;
    float minY = centre_y - uni_magnify_circleRadius;

    if ( UV.x > minX && UV.x < maxX && UV.y > minY && UV.y < maxY)  {
        float relX = UV.x - centre_x;
        float relY = UV.y - centre_y;
        float ang =  atan(relY, relX);
        float dist = sqrt(relX*relX + relY*relY);
    
      if ( dist <= uni_magnify_circleRadius )  {
          float newRad = dist * ( (uni_magnify_maxZoom * dist/uni_magnify_circleRadius) + uni_magnify_minZoom );
          float newX = centre_x + cos( ang ) * newRad;
          newX *= (uni_magnify_resolution.y/uni_magnify_resolution.x);
          float newY = centre_y + sin( ang ) * newRad;
          gl_FragColor = v_vColour * texture2D(gm_BaseTexture, vec2(newX, newY) );
      }
      else {
          gl_FragColor = v_vColour * base_texture;
      }
	}
	else {
       gl_FragColor = v_vColour * base_texture;
	}
}