attribute vec4 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec4 v_vTexcoord[8];
varying vec4 v_vColour;

uniform vec2 u_vTexel;

void main()
{
    //     A1 B1 C1
    //  A0  A  B  C C4
    //  D0  D  E  F F4
    //  G0  G  H  I I4
    //     G5 H5 I5
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    v_vTexcoord[0] = in_TextureCoord.xyxy;
    v_vTexcoord[1] = in_TextureCoord.xxxy + vec4(      -u_vTexel.x,           0, u_vTexel.x, -2.0 * u_vTexel.y);  //  A1 B1 C1
    v_vTexcoord[2] = in_TextureCoord.xxxy + vec4(      -u_vTexel.x,           0, u_vTexel.x,       -u_vTexel.y);  //   A  B  C
    v_vTexcoord[3] = in_TextureCoord.xxxy + vec4(      -u_vTexel.x,           0, u_vTexel.x,                 0);  //   D  E  F
    v_vTexcoord[4] = in_TextureCoord.xxxy + vec4(      -u_vTexel.x,           0, u_vTexel.x,        u_vTexel.y);  //   G  H  I
    v_vTexcoord[5] = in_TextureCoord.xxxy + vec4(      -u_vTexel.x,           0, u_vTexel.x,  2.0 * u_vTexel.y);  //  G5 H5 I5
    v_vTexcoord[6] = in_TextureCoord.xyyy + vec4(-2.0 * u_vTexel.x, -u_vTexel.y,          0,        u_vTexel.y);  //  A0 D0 G0
    v_vTexcoord[7] = in_TextureCoord.xyyy + vec4( 2.0 * u_vTexel.x, -u_vTexel.y,          0,        u_vTexel.y);  //  C4 F4 I4
    
    v_vColour = in_Colour;
}