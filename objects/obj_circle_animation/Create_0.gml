color = c_white;

PI = 3.1415926;
TWOPI = 6.2831852;
MAX_R = 50;
SPEED_DIV = 20;
radius = 1;
star_ct = 10;

// init stars
for (var i = 0; i < star_ct; i++) {
	stars[i] = instance_create_depth(x, y, -1, obj_circle_particle);	
	stars[i].image_blend = color;
}


theta = 0;
ticks = 0;
