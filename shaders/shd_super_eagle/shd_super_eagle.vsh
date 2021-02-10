attribute vec4 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec4 v_vTexcoord[8];
varying vec4 v_vColour;

uniform vec2 u_vTexel;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y , in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    float dx = u_vTexel.x;
    float dy = u_vTexel.y;
    
    v_vTexcoord[0].xy = in_TextureCoord + vec2(   -dx,   -dy);
    v_vTexcoord[0].zw = in_TextureCoord + vec2(   -dx,     0);
    v_vTexcoord[1].xy = in_TextureCoord + vec2(    dx,   -dy);
    v_vTexcoord[1].zw = in_TextureCoord + vec2( dx+dx,   -dy);
    v_vTexcoord[2].xy = in_TextureCoord + vec2(   -dx,     0);
    v_vTexcoord[2].zw = in_TextureCoord + vec2(    dx,     0);
    v_vTexcoord[3].xy = in_TextureCoord + vec2( dx+dx,     0);
    v_vTexcoord[3].zw = in_TextureCoord + vec2(   -dx,    dy);
    v_vTexcoord[4].xy = in_TextureCoord + vec2(     0,    dy);
    v_vTexcoord[4].zw = in_TextureCoord + vec2(    dx,    dy);
    v_vTexcoord[5].xy = in_TextureCoord + vec2( dx+dx,    dy);
    v_vTexcoord[5].zw = in_TextureCoord + vec2(   -dx, dy+dy);
    v_vTexcoord[6].xy = in_TextureCoord + vec2(     0, dy+dy);
    v_vTexcoord[6].zw = in_TextureCoord + vec2(    dx, dy+dy);
    v_vTexcoord[7].xy = in_TextureCoord + vec2( dx+dx, dy+dy);
    v_vTexcoord[7].zw = in_TextureCoord;
    
    v_vColour = in_Colour;
}