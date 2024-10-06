grounded = false; // assume not grounded

// movement controls
if (MOVING_LEFT) {
	xv -= .1;
}

if (MOVING_RIGHT) {
	xv += .1;
}

if (MOVING_FLAP) {
	yv -= 8.5;
}

// cap values
y = max(y, -10);
yv = max(yv, -10);
xv = max(xv, -10);
xv = min(xv, 10);

// apply movement
x += xv;
y += yv;
yv += g;
xv *= f;

// collide with platforms
if (yv >= 0) {
	var platform = collision_rectangle(x - sprite_width / 2, y, x + sprite_width / 2, y + sprite_height / 2 + yv, obj_platform, 0, 1);
	if (platform) {
		y = platform.y - sprite_height / 2;
		yv = 0;
		grounded = true;
	}
}

if (yv < 0) {
	var platform = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2 + yv, x + sprite_width / 2, y, obj_platform, 0, 1);
	if (platform) {
		yv = 0;	
	}
}

if (xv >= 0) {
	var	platform = collision_rectangle(x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2 + xv, y, obj_platform, 0, 1);
	if (platform) {
		xv *= -1;
	}
}

if (xv < 0) {
	var	platform = collision_rectangle(x - sprite_width / 2 + xv, y - sprite_height / 2, x + sprite_width / 2, y, obj_platform, 0, 1);
	if (platform) {
		xv *= -1;
	}
}


// wrap around screen
if (x < 0) {
	x = room_width;
}

if (x > room_width) {
	x = 0;	
}

// collide with floor
if (y >= 700) {
	y = 700;
	yv = 0;
	grounded = true;
}

// change sprite accordingly
if (grounded) {
	if (xv < 0) {
		// switch to left sprite
		sprite_index = sprite_grounded;
	} else {
		// switch to right sprite
		sprite_index = sprite_grounded;
	}
	
	if (MOVING_LEFT && xv > 0) {
		// switch to slowing down sprite	
		sprite_index = sprite_slowing;
	}
	
	if (MOVING_RIGHT && xv < 0) {
		// switch to slowing down sprite
		sprite_index = sprite_slowing;
	}
} else {
	// switch to flying sprite
	sprite_index = sprite_flying;	
}
