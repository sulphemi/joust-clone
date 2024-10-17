/// @description Insert description here
// You can write your code in this editor
function pick_new_y() {
	target_y = [128, 320, 512, 700][irandom_range(0, 3)];
	//target_y = random_range(500, 100);	
}

facing = 0;
MOVING_LEFT = irandom_range(0, 500);

sprite_flying = spr_flying;
sprite_grounded = spr_flying;
sprite_slowing = spr_flying;

flap_cooldown = 0;

// Inherit the parent event
event_inherited();

flap_frames = 0;

XV_LOWER = -3;
XV_UPPER = 3;

pick_new_y();
FLAP_DELTA = 8;

