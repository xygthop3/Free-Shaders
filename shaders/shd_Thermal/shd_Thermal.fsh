//
// Thermalfragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 base_colour = texture2D(gm_BaseTexture, v_vTexcoord);
    
    float lum = (base_colour.r+base_colour.g+base_colour.b)/3.0;
    
    vec3 colour_1 = vec3(0.0,0.0,1.0);
    vec3 colour_2 = vec3(1.0,1.0,0.0);
    vec3 colour_3 = vec3(1.0,0.0,0.0);
    
    vec3 ix = vec3(0.0);
    vec3 ix_2 = vec3(0.0);
    if (lum < 0.5)
    {
        ix = colour_1;
        ix_2 = colour_2;
    }
    else
    {
        ix = colour_2;
        ix_2 = colour_3;
    }
    
    
    vec3 thermal = mix(ix, ix_2, (lum-float(ix)*0.5)/0.5);
    
 gl_FragColor = v_vColour * vec4(thermal, base_colour.a);
 
}