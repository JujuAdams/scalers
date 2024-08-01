// Feather disable all

/// @param texture

function Shader2xSal(_texture)
{
    static _uniform = shader_get_uniform(shd_2xsal, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(false);
    shader_set(shd_2xsal);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}