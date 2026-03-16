/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv

if (place_meeting(x,y+1,obj_invisible_wall)) && (key_jump)
{
	vsp = -jumpsp
}

//Horizontal collision
if (place_meeting(x+hsp,y,obj_invisible_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_invisible_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if (place_meeting(x, y + vsp, obj_invisible_wall))
{
    if (vsp > 0) 
    {
        effect_create_depth(real,ef_smoke, x, y + 50, 1, c_white);
    }
    while (!place_meeting(x, y + sign(vsp), obj_invisible_wall))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;


//Animations
if (!place_meeting(x,y+1,obj_invisible_wall))
{
	sprite_index = spr_playerA;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_playerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);