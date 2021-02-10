var _texture = sprite_get_texture(sprite_index, 0);
var _tw = texture_get_texel_width(_texture);
var _th = texture_get_texel_height(_texture);

var _old_tex_filter = gpu_get_tex_filter();

switch(shader_array[shader_index])
{
    case shd_bicubic: //Flexible scaling
        gpu_set_tex_filter(true);
        shader_set(shd_bicubic);
        shader_set_uniform_f(shader_get_uniform(shd_bicubic, "u_vTexel"), _tw, _th);
        draw_sprite_stretched(sprite_index, image_index, x, y, room_width-1, room_height-1);
        shader_reset();
    break;
    
    case shd_2xsal: //Fixed scaling x2
        gpu_set_tex_filter(false);
        shader_set(shd_2xsal);
        shader_set_uniform_f(shader_get_uniform(shd_2xsal, "u_vTexel"), _tw, _th);
        draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case shd_super_eagle: //Fixed scaling x2
        gpu_set_tex_filter(false);
        shader_set(shd_super_eagle);
        shader_set_uniform_f(shader_get_uniform(shd_super_eagle, "u_vTexel"), _tw, _th);
        shader_set_uniform_f(shader_get_uniform(shd_super_eagle, "u_vTextureSize"), sprite_get_width(sprite_index), sprite_get_height(sprite_index));
        draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case shd_hq4x: //Fixed scaling x4
        gpu_set_tex_filter(false);
        shader_set(shd_hq4x);
        shader_set_uniform_f(shader_get_uniform(shd_hq4x, "u_vTexel"), _tw, _th);
        draw_sprite_ext(sprite_index, image_index, x, y, 4, 4, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case shd_5xbr_round: //Fixed scaling x5
        gpu_set_tex_filter(false);
        shader_set(shd_5xbr_round);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_round, "u_vTexel"), _tw, _th);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_round, "u_vTextureSize"), sprite_get_width(sprite_index), sprite_get_height(sprite_index));
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case shd_5xbr_semiround: //Fixed scaling x5
        gpu_set_tex_filter(false);
        shader_set(shd_5xbr_semiround);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_semiround, "u_vTexel"), _tw, _th);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_semiround, "u_vTextureSize"), sprite_get_width(sprite_index), sprite_get_height(sprite_index));
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    case shd_5xbr_square: //Fixed scaling x5
        gpu_set_tex_filter(false);
        shader_set(shd_5xbr_square);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_square, "u_vTexel"), _tw, _th);
        shader_set_uniform_f(shader_get_uniform(shd_5xbr_square, "u_vTextureSize"), sprite_get_width(sprite_index), sprite_get_height(sprite_index));
        draw_sprite_ext(sprite_index, image_index, x, y, 5, 5, 0, c_white, 1.0);
        shader_reset();
    break;
    
    default: //Flexible scaling
        gpu_set_tex_filter(false);
        draw_sprite_stretched(sprite_index, image_index, x, y, room_width-1, room_height-1);
    break;
}

gpu_set_tex_filter(_old_tex_filter);