// controls
LEFT = ord("A");
RIGHT = ord("D");
FLAP = vk_space;
UP = ord("W");
DOWN = ord("S");
DASH = vk_lshift;

sprite_flying = spr_player_flying;
sprite_grounded = spr_player;
sprite_slowing = spr_player_slowing;

dash_ok = true;

// Inherit the parent event
event_inherited();

hitbox_width = 30;

dashless_blend = make_color_rgb(150, 150, 255);
collidable_frames = 0;

function die() {
	x = startx;
	y = starty;
	
	xv = 0;
	yv = 0;
}