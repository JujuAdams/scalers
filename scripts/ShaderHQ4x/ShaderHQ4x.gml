// Feather disable all

/// @param texture

function ShaderHQ4x(_texture)
{
    static _uniform = shader_get_uniform(shd_hq4x, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(false);
    shader_set(shd_hq4x);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}