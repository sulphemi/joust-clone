color = make_color_rgb(120, 200, 255);

PI = 3.1415926;
TWOPI = 6.2831852;
MAX_R = 400;
SPEED_DIV = 45;
radius = 1;
star_ct = 10;
d_theta = 0.1;

// special case for final death
if (lives == 0) {
	SPEED_DIV = 70;
	d_theta = 0.025;
	color = c_white;
	MAX_R = 1200;
}

// init stars
for (var i = 0; i < star_ct; i++) {
	stars[i] = instance_create_depth(x, y, -1, obj_circle_particle);	
	stars[i].image_xscale = 1/8;
	stars[i].image_yscale = 1/8;
	stars[i].image_blend = color;
}


theta = 0;
ticks = 0;
