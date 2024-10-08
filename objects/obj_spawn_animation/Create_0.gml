entity = [obj_rider, obj_flying, obj_elite][irandom_range(0, 2)];
color = c_red;

PI = 3.1415926;
TWOPI = 6.2831852;
MAX_R = 150;
SPEED_DIV = 80;
radius = 1;
star_ct = 10;
d_theta = 0.05;
if (random(1) < 0.5) d_theta *= -1;

// init stars
for (var i = 0; i < star_ct; i++) {
	stars[i] = instance_create_depth(x, y, -1, obj_circle_particle);	
	stars[i].image_blend = color;
	stars[i].image_xscale = 1/8;
	stars[i].image_yscale = 1/8;
}


theta = 0;
ticks = 0;
