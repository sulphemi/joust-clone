// controls
LEFT = vk_left;
RIGHT = vk_right;
FLAP = vk_space;
UP = vk_up;
DASH = vk_lcontrol;

sprite_flying = Sprite1_2;
sprite_grounded = Sprite1;
sprite_slowing = Sprite1_1;

dash_ok = true;

// Inherit the parent event
event_inherited();

function die() {
	x = startx;
	y = starty;
	
	xv = 0;
	yv = 0;
}