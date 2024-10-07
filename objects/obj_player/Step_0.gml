
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
	
	// instantly change position
	if (MOVING_LEFT) x -= 100;
	if (MOVING_RIGHT) x += 100;
	if (keyboard_check(UP)) y -= 100;
	if (keyboard_check(DOWN)) y += 100;
	
	yv = min(0, yv);
}


// collision with enemies
var collided = collision_rectangle(x - hitbox_width / 2, y - hitbox_height / 2, x + hitbox_width / 2, y + hitbox_height / 2, obj_enemy, 0, 1);
if (collided) {
	if (y < collided.y - collided.sprite_height / 2) { // the thing is below me
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