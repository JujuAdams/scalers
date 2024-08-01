if (keyboard_check_pressed(vk_left))
{
    shaderIndex = (shaderIndex - 1 + array_length(shaderArray)) mod array_length(shaderArray);
}

if (keyboard_check_pressed(vk_right))
{
    shaderIndex = (shaderIndex + 1 + array_length(shaderArray)) mod array_length(shaderArray);
}

if (keyboard_check_pressed(vk_up))
{
    spriteIndex = (spriteIndex - 1 + array_length(spriteArray)) mod array_length(spriteArray);
    sprite_index = spriteArray[spriteIndex];
}

if (keyboard_check_pressed(vk_down))
{
    spriteIndex = (spriteIndex + 1 + array_length(spriteArray)) mod array_length(spriteArray);
    sprite_index = spriteArray[spriteIndex];
}

if (keyboard_check_pressed(vk_space))
{
    image_speed = (image_speed == 0)? 1 : 0;
}

layer_x("Checkerboard", (layer_get_x("Checkerboard") + 0.5) mod sprite_get_width(sCheckerboard));
layer_y("Checkerboard", (layer_get_y("Checkerboard") + 0.5) mod sprite_get_height(sCheckerboard));