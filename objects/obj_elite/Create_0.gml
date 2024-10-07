/// @description Insert description here
// You can write your code in this editor

facing = 0;
MOVING_LEFT = irandom_range(0, 500);

sprite_flying = spr_flying;
sprite_grounded = spr_flying;
sprite_slowing = spr_flying;

flap_cooldown = 0;

// Inherit the parent event
event_inherited();

flap_frames = 0;

XV_LOWER = -5;
XV_UPPER = 5;