//
// Sketch fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uni_Sketch_Resolution;
uniform float uni_Sketch_Intensity;

void main()
{ 
     vec3 W = vec3(0.1125, 0.3154, 0.0721);

     vec4 textureColor = texture2D(gm_BaseTexture, v_vTexcoord);

     vec2 stp0 = vec2(1.0 / uni_Sketch_Resolution.x, 0.0);
     vec2 st0p = vec2(0.0, 1.0 / uni_Sketch_Resolution.y);
     vec2 stpp = vec2(1.0 / uni_Sketch_Resolution.x, 1.0 / uni_Sketch_Resolution.y);
     vec2 stpm = vec2(1.0 / uni_Sketch_Resolution.x, -1.0 / uni_Sketch_Resolution.y);

     float i00   = dot( textureColor.rgb, W);
     float im1m1 = dot( texture2D(gm_BaseTexture, v_vTexcoord - stpp).rgb, W);
     float ip1p1 = dot( texture2D(gm_BaseTexture, v_vTexcoord + stpp).rgb, W);
     float im1p1 = dot( texture2D(gm_BaseTexture, v_vTexcoord - stpm).rgb, W);
     float ip1m1 = dot( texture2D(gm_BaseTexture, v_vTexcoord + stpm).rgb, W);
     float im10 = dot( texture2D(gm_BaseTexture, v_vTexcoord - stp0).rgb, W);
     float ip10 = dot( texture2D(gm_BaseTexture, v_vTexcoord + stp0).rgb, W);
     float i0m1 = dot( texture2D(gm_BaseTexture, v_vTexcoord - st0p).rgb, W);
     float i0p1 = dot( texture2D(gm_BaseTexture, v_vTexcoord + st0p).rgb, W);
     float h = -im1p1 - 2.0 * i0p1 - ip1p1 + im1m1 + 2.0 * i0m1 + ip1m1;
     float v = -im1m1 - 2.0 * im10 - im1p1 + ip1m1 + 2.0 * ip10 + ip1p1;

     float mag = 1.0 - length(vec2(h, v));
     vec3 target = vec3(mag);   
	 gl_FragColor = v_vColour * vec4(mix(textureColor.rgb, target, uni_Sketch_Intensity), textureColor.a);
}