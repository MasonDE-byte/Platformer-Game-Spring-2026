/// @desc Wrapping When Outside The Screen

//The Wrapping aorund the room
if (y > 0)
	move_wrap(true,true,8)
	
// Limit the speed
vsp = clamp(vsp, -100, max_fall_speed);