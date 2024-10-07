
// controls
MOVING_LEFT = keyboard_check(LEFT);
MOVING_RIGHT = keyboard_check(RIGHT);
MOVING_FLAP = keyboard_check_pressed(FLAP);

// Inherit the parent event
event_inherited();

// refresh dash if grounded
if (grounded) dash_ok = true;

// dash
if (dash_ok and keyboard_check_pressed(DASH)) {
	dash_ok = false; // consume dash
	
	// cache previous position
	var prev_x = x;
	var prev_y = y;
	
	// instantly change position
	if (MOVING_LEFT ^ MOVING_RIGHT) { // exor
		if (MOVING_LEFT) {
			x -= 150;
			xv = min(xv, 0);
		}
		if (MOVING_RIGHT) {
			x += 150;
			xv = max(xv, 0);
		}
	} else { // only one is being pressed
		if (facing) {
			x += 150;
		} else {
			x -= 150;	
		}
	}
	if (keyboard_check(UP)) y -= 150;
	if (keyboard_check(DOWN)) y += 150;
	yv = min(0, yv);
	
	// draw particles
	for (var i = 0; i < 30; i++) {
		var instance = instance_create_depth(prev_x, prev_y, -1, obj_dash_particle);
	}
	
	// if i dashed into something, kill that thing
	var dashed_into = collision_line(prev_x, prev_y, x, y, obj_enemy, 0, 1);
	if (dashed_into) instance_destroy(dashed_into);
	
	// if i ended up in something, kill that thing
	collidable_frames = 10;
}

if (collidable_frames) collidable_frames--;

if (dash_ok) {
	image_blend = -1;	
} else {
	image_blend = dashless_blend;
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
		}
		
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

// lerpy derpy
/*
if (MOVING_LEFT || MOVING_RIGHT) {
	image_yscale = lerp(image_yscale, 0.9, 0.1);
} else {
	image_yscale = lerp(image_yscale, 1.0, 0.4);
}
*/

if (FLAP) {
	image_yscale = 0.9;
} else {
	image_yscale = lerp(image_yscale, 1.0, 0.1);	
}
