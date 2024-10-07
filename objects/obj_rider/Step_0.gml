/// @description Insert description here
// You can write your code in this editor

if (flap_cooldown <= 0 && grounded && random(1) < 0.1) {
	MOVING_FLAP = true;
	flap_cooldown = irandom_range(0, 30);
} else {
	MOVING_FLAP = false;
	if (flap_cooldown > 0) flap_cooldown--;
}

if (MOVING_LEFT + MOVING_RIGHT > 0) { // my controls are "pressed"
	if (MOVING_LEFT) MOVING_LEFT--;
	if (MOVING_RIGHT) MOVING_RIGHT--;
} else {
	// coin toss to determine new direction
	if (random(1) < 0.5) {
		MOVING_RIGHT = irandom_range(0, 500);
	} else {
		MOVING_LEFT = irandom_range(0, 500);
	}
}

// Inherit the parent event
event_inherited();

// collide with other enemies
var collided = collision_rectangle(x - hitbox_width / 2, y - hitbox_width / 2, x + hitbox_width / 2, y + hitbox_height / 2, obj_enemy, 0, 1);
if (collided) {
	if (y < collided.y - collided.hitbox_height / 2) { // the thing is below me
		//yv *= -1;
		yv = -8; // small bounce
	} else {
		if (y > collided.y + collided.hitbox_height / 2) {
			// the thing is way above me
			// do nothing
		} else {
			// bounce
			xv *= -1;	
		}
	}
}