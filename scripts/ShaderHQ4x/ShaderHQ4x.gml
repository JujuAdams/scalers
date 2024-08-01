// Feather disable all

/// Sets up a HQ4x pixel art upscaling shader.
/// 
/// N.B. Calling this function will set GameMaler's native texture filtering to <false>. You may
///      need to call gpu_set_tex_filter(true) after drawing depending on the needs of your game.
/// 
/// 
/// Example usage:
/// 
///     var _texture = surface_get_texture(application_surface);
///     ShaderHQ4x(_texture);
///     draw_surface_ext(application_surface, 0, 0, 4, 4, 0, c_white, 1);
///     shader_reset();
/// 
/// 
/// @param texture

function ShaderHQ4x(_texture)
{
    static _uniform = shader_get_uniform(__shdHQ4x, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(false);
    shader_set(__shdHQ4x);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}