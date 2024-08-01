// Feather disable all

var _shader = shaderArray[shaderIndex];
if (_shader == -1)
{
    var _string = "";
}
else
{
    var _string = shader_get_name(shaderArray[shaderIndex]);
}

draw_text(10, 10, _string);