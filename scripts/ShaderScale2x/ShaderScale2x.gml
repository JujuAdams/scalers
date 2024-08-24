// Feather disable all

/// Sets up a Scale2x pixel art upscaling shader.
/// 
/// N.B. This shader does not support alpha blending.
/// 
/// N.B. Calling this function will set GameMaler's native texture filtering to <false>. You may
///      need to call gpu_set_tex_filter(true) after drawing depending on the needs of your game.
/// 
/// 
/// Example usage:
/// 
///     var _texture = surface_get_texture(application_surface);
///     ShaderScale2x(_texture);
///     draw_surface_ext(application_surface, 0, 0, 2, 2, 0, c_white, 1);
///     shader_reset();
/// 
/// 
/// @param texture

function ShaderScale2x(_texture)
{
    static _uniform = shader_get_uniform(__shdScale2x, "u_vTexel");
    
    var _texelWidth  = texture_get_texel_width(_texture);
    var _texelHeight = texture_get_texel_height(_texture);
    
    gpu_set_tex_filter(false);
    shader_set(__shdScale2x);
    shader_set_uniform_f(_uniform, _texelWidth, _texelHeight);
}