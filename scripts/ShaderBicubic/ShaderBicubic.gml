// Feather disable all

/// Sets up a bicubic interpolation shader. This is a smoother interpolation than GameMaker's
/// native bilinear interpolation.
/// 
/// N.B. Calling this function will set GameMaler's native texture filtering to <true>. You may
///      need to call gpu_set_tex_filter(false) after drawing depending on the needs of your game.
/// 
/// 
/// Example usage:
/// 
///     var _texture = surface_get_texture(application_surface);
///     ShaderBicubic(_texture);
///     
///     var _pos = application_get_position();
///     draw_surface_stretched(application_surface, _pos[0], _pos[1], _pos[2] - _pos[0], _pos[3] - _pos[1]);
///     
///     shader_reset();
/// 
/// 
/// @param texture

function ShaderBicubic(_texture)
{
    static _uniform = shader_get_uniform(__shdBicubic, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(true);
    shader_set(__shdBicubic);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}