theta += d_theta;

for (var i = 0; i < star_ct; i++) {
	var phi = i * TWOPI / star_ct + theta;
	var star = stars[i];
	star.x = x + radius * cos(phi);
	star.y = y + radius * sin(phi);	
}

var zeta = ticks++ / SPEED_DIV;
radius = MAX_R * sin(zeta);
if (zeta > PI) instance_destroy();