// Feather disable all

/// @param texture

function ShaderBicubic(_texture)
{
    static _uniform = shader_get_uniform(shd_bicubic, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(true);
    shader_set(shd_bicubic);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}