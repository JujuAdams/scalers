if (keyboard_check_pressed(vk_left))
{
    shader_index = (shader_index - 1 + array_length(shader_array)) mod array_length(shader_array);
}

if (keyboard_check_pressed(vk_right))
{
    shader_index = (shader_index + 1 + array_length(shader_array)) mod array_length(shader_array);
}