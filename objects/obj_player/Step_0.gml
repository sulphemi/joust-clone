if (dead) exit;

// controls
MOVING_LEFT = keyboard_check(LEFT);
MOVING_RIGHT = keyboard_check(RIGHT);
//MOVING_FLAP = keyboard_check_pressed(FLAP);
MOVING_UP = keyboard_check(FLAP);
UP_PRESSED = keyboard_check(UP);
DOWN_PRESSED = keyboard_check(DOWN);

if (MOVING_UP) {
	yv -= 0.8;	
}

// refresh dash if grounded
if (grounded) dash_ok = true;

// dash
if (dash_ok and keyboard_check_pressed(DASH)) {
	dash_ok = false; // consume dash
	
	// cache previous position
	var prev_x = x;
	var prev_y = y;
	
	// prioritize up/down dash
	if (UP_PRESSED ^ DOWN_PRESSED) {
		if (UP_PRESSED) {
			y -= 200;
		} else {
			y += 150;
		}
	} else if (MOVING_LEFT ^ MOVING_RIGHT) { // one or the other being pressed
		if (MOVING_LEFT) {
			x -= 300;
			xv = min(xv, 0);
		}
		if (MOVING_RIGHT) {
			x += 300;
			xv = max(xv, 0);
		}
	} else { // either both pressed or none pressed
		if (facing) {
			x += 300;
		} else {
			x -= 300;	
		}
	}

	yv = min(0, yv);
	
	// draw particles
	for (var i = 0; i < 30; i++) {
		var instance = instance_create_depth(prev_x, prev_y, -1, obj_dash_particle);
	}
	for (var i = 0; i < 4; i++) {
		var _x = prev_x + (x - prev_x) / 4 * i;
		var _y = prev_y + (y - prev_y) / 4 * i;
		var instance = instance_create_layer(_x, _y, "layer_particles", obj_afterimage);
		if (facing) instance.image_xscale = -1;
	}
	
	// if i dashed into something, kill that thing
	// hitbox is extended to 2x the sprite width to provide a generous amount of padding
	var dashed_into = collision_rectangle(prev_x, prev_y - sprite_height, x, y + sprite_height, obj_enemy, 0, 1);
	if (dashed_into) instance_destroy(dashed_into);
	
	// if i ended up in something, kill that thing
	collidable_frames = 20;
}

if (collidable_frames) collidable_frames--;


// Inherit the parent event
event_inherited();


if (dash_ok) {
	image_blend = -1;	
} else {
	image_blend = dashless_blend;
}


if (iframes) {
	iframes--;
	image_alpha = 0.5;
	exit;
} else {
	image_alpha = 1.0;	
}

// collision with enemies
var collided = collision_rectangle(x - hitbox_width / 2, y - hitbox_height / 2, x + hitbox_width / 2, y + hitbox_height / 2, obj_enemy, 0, 1);
if (collided) {
	if (collidable_frames) { // i just came off of a dash
		instance_destroy(collided);
	} else if (y < collided.y - collided.sprite_height / 2) { // the thing is below me
		//yv *= -1;
		yv = -8; // small bounce
		instance_destroy(collided, true); // kill the thing
		dash_ok = true; // refresh dash
	} else {
		if (y > collided.y + collided.sprite_height / 2) {
			// the thing is way above me
			die();
		} else {
			if (collided.facing) { // enemy is facing right
				if (x > collided.x) {
					// die
					die();
				} else {
					// bounce
					xv *= -1;
				}
			} else { // enemy is facing left
				if (x < collided.x) {
					//die	
					die();
				} else {
					//bounce
					xv *= -1;
				}
			}
		}
	}
}
