// Feather disable all

/// @param texture

function Shader5xBRRound(_texture)
{
    static _uniformTexel       = shader_get_uniform(shd_5xbr_round, "u_vTexel");
    static _uniformTextureSize = shader_get_uniform(shd_5xbr_round, "u_vTextureSize");
    
    var _texelWidth    = texture_get_texel_width(_texture);
    var _texelHeight   = texture_get_texel_height(_texture);
    var _textureWidth  = 1/_texelWidth;
    var _textureHeight = 1/_texelHeight;
    
    gpu_set_tex_filter(false);
    shader_set(shd_5xbr_round);
    shader_set_uniform_f(_uniformTexel, _texelWidth, _texelHeight);
    shader_set_uniform_f(_uniformTextureSize, _textureWidth, _textureHeight);
}