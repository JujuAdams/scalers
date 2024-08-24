varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexel;

void main()
{
    // subpixel determination
    vec2 fp = fract(v_vTexcoord / u_vTexel);
    
    /*
    	  B		E0 E1
    	D E F	E2 E3
    	  H
    */
    
    // reading the texels
    vec3 B = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, -u_vTexel.y)).rgb;
    vec3 D = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-u_vTexel.x, 0.0)).rgb;
    vec3 E = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    vec3 F = texture2D(gm_BaseTexture, v_vTexcoord + vec2(u_vTexel.x, 0.0)).rgb;
    vec3 H = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, u_vTexel.y)).rgb;
    
    // rules
    vec3 E0 = (B == D)? B : E;
    vec3 E1 = (B == F)? B : E;
    vec3 E2 = (H == D)? H : E;
    vec3 E3 = (H == F)? H : E;
    
    // general condition & subpixel output
    gl_FragColor = vec4(((B != H) && (D != F))? ((fp.y < 0.5)? ((fp.x < 0.5)? E0 : E1) : ((fp.x < 0.5)? E2 : E3)) : E, 1.0);
} 