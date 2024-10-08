/// @description Insert description here
// You can write your code in this editor

facing = 0;
MOVING_LEFT = 1;

sprite_flying = spr_player_flying;
sprite_grounded = spr_player_flying;
sprite_slowing = spr_player_flying;

flap_cooldown = 0;

// Inherit the parent event
event_inherited();

flap_frames = 0;

XV_LOWER = -3;
XV_UPPER = 3;