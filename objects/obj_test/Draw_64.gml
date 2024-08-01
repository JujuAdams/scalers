// Feather disable all

var _shader = shaderArray[shaderIndex];
if (_shader == -1)
{
    if (shaderIndex == 0)
    {
        var _string = "No filtering";
    }
    else if (shaderIndex == 1)
    {
        var _string = "Bilinear";
    }
    else
    {
        var _string = "";
    }
}
else
{
    var _string = script_get_name(shaderArray[shaderIndex]);
}

_string = $"<- {_string} ->";

_string += $"\n^ {sprite_get_name(sprite_index)} v";

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_text(10, 12, _string);
draw_set_alpha(1);
draw_text( 9, 10, _string);
draw_text(11, 10, _string);
draw_text(10,  9, _string);
draw_text(10, 11, _string);
draw_set_color(c_white);
draw_text(10, 10, _string);