varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexel;

void main()
{
    float dx = u_vTexel.x * 0.25;
    float dy = u_vTexel.y * 0.25;
    vec3  dt = vec3(1.0);
    
    vec2 UL = v_vTexcoord + vec2(-dx, -dy);
    vec2 UR = v_vTexcoord + vec2( dx, -dy);
    vec2 DL = v_vTexcoord + vec2(-dx,  dy);
    vec2 DR = v_vTexcoord + vec2( dx,  dy);
    
    vec3 c00 = texture2D(gm_BaseTexture, UL).rgb;
    vec3 c20 = texture2D(gm_BaseTexture, UR).rgb;
    vec3 c02 = texture2D(gm_BaseTexture, DL).rgb;
    vec3 c22 = texture2D(gm_BaseTexture, DR).rgb;
    
    float m1 = dot(abs(c00 - c22), dt) + 0.001;
    float m2 = dot(abs(c02 - c20), dt) + 0.001;
    
    gl_FragColor = vec4((m1*(c02 + c20) + m2*(c22 + c00))/(2.0*(m1 + m2)), 1.0);
} 