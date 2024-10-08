if (brick_ct) {
	brick_ct--;
	x += 32;
	if (x > room_width) x = 0;
	instance_create_layer(x, y, "layer_platforms", obj_gameplatform);
} else {
	instance_destroy();
}