/// @description Insert description here
// You can write your code in this editor

if (y > 500 || (flap_cooldown <= 0 && random(1) < 0.1)) {
	MOVING_FLAP = true;
	flap_cooldown = irandom_range(0, 20);
} else {
	MOVING_FLAP = false;
	if (flap_cooldown > 0) flap_cooldown--;
}

MOVING_LEFT = 1;

// Inherit the parent event
event_inherited();


if (MOVING_FLAP) {
	sprite_index = spr_doppel;
	flap_frames = 10;
} else {
	if (flap_frames) {
		sprite_index = spr_doppel;
		flap_frames--;
	} else {
		sprite_index = spr_doppel;	
	}
}

image_yscale = 3;
image_xscale *= 3;
