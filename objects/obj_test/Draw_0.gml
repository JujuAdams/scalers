var _texture = sprite_get_texture(sprite_index, 0);
var _tw = texture_get_texel_width(_texture);
var _th = texture_get_texel_height(_texture);

var _old_tex_filter = gpu_get_tex_filter();

switch(shaderArray[shaderIndex])
{
    case ShaderBicubic: //Flexible scaling
        ShaderBicubic(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        gpu_set_tex_filter(false);
        shader_reset();
    break;
    
    case Shader2xSal: //Fixed scaling x2
        Shader2xSal(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case ShaderSuperEagle: //Fixed scaling x2
        ShaderSuperEagle(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case ShaderHQ4x: //Fixed scaling x4
        ShaderHQ4x(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case Shader5xBRRound: //Fixed scaling x5
        Shader5xBRRound(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case Shader5xBRSemiRound: //Fixed scaling x5
        Shader5xBRSemiRound(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case Shader5xBRSquare: //Fixed scaling x5
        Shader5xBRSquare(_texture);
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    default: //Flexible scaling
        gpu_set_tex_filter(shaderIndex == 1);
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
    break;
}

gpu_set_tex_filter(_old_tex_filter);