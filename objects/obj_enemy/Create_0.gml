/// @description Insert description here
// You can write your code in this editor

facing = 0;
MOVING_LEFT = irandom_range(0, 500);

sprite_flying = Sprite2;
sprite_grounded = Sprite2;
sprite_slowing = Sprite2;

flap_cooldown = 0;

// Inherit the parent event
event_inherited();

