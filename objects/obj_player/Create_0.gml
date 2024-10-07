// controls
LEFT = ord("A");
RIGHT = ord("D");
FLAP = vk_space;
UP = ord("W");
DOWN = ord("S");
DASH = vk_lshift;

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