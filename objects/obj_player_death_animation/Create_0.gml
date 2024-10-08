color = make_color_rgb(120, 200, 255);

PI = 3.1415926;
TWOPI = 6.2831852;
MAX_R = 100;
SPEED_DIV = 45;
radius = 1;
star_ct = 10;
d_theta = 0.1;

// init stars
for (var i = 0; i < star_ct; i++) {
	stars[i] = instance_create_depth(x, y, -1, obj_circle_particle);	
	stars[i].image_xscale = 1/8;
	stars[i].image_yscale = 1/8;
	stars[i].image_blend = color;
}


theta = 0;
ticks = 0;
