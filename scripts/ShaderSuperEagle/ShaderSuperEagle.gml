// Feather disable all

/// Sets up a Super Eagle pixel art upscaling shader.
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
///     ShaderSuperEagle(_texture);
///     draw_surface_ext(application_surface, 0, 0, 2, 2, 0, c_white, 1);
///     shader_reset();
/// 
/// 
/// @param texture

function ShaderSuperEagle(_texture)
{
    static _uniformTexel       = shader_get_uniform(__shdSuperEagle, "u_vTexel");
    static _uniformTextureSize = shader_get_uniform(__shdSuperEagle, "u_vTextureSize");
    
    var _texelWidth    = texture_get_texel_width(_texture);
    var _texelHeight   = texture_get_texel_height(_texture);
    var _textureWidth  = 1/_texelWidth;
    var _textureHeight = 1/_texelHeight;
    
    gpu_set_tex_filter(false);
    shader_set(__shdSuperEagle);
    shader_set_uniform_f(_uniformTexel, _texelWidth, _texelHeight);
    shader_set_uniform_f(_uniformTextureSize, _textureWidth, _textureHeight);
}