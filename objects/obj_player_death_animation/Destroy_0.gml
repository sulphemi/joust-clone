/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (lives) {
	obj_player.dead = false;
	lives--;
} else {
	room = rm_end;	
}
