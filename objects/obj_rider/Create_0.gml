/// @description Insert description here
// You can write your code in this editor

facing = 0;
MOVING_LEFT = irandom_range(0, 500);

sprite_flying = spr_rider;
sprite_grounded = spr_rider;
sprite_slowing = spr_rider;

flap_cooldown = 0;

// Inherit the parent event
event_inherited();