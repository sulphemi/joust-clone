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
dead = false;
iframes = 60;

function die() {
	obj_screenshakeotron9000.shake_screen();
	instance_create_depth(x, y, -10, obj_player_death_animation);
	dead = true;
	
	x = startx;
	y = starty;
	
	xv = 0;
	yv = 0;
	
	iframes = 60;
}