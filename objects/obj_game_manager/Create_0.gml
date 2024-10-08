function refresh_room() {
	// destroy all gameplatforms
	instance_destroy(obj_gameplatform);
	
	// make bricklayers
	instance_create_layer(32 * irandom_range(0, 43), 128, "layer_platforms", obj_bricklayer);
	instance_create_layer(32 * irandom_range(0, 43), 320, "layer_platforms", obj_bricklayer);
	instance_create_layer(32 * irandom_range(0, 43), 512, "layer_platforms", obj_bricklayer);
	
	ready = false;
}

ready = true;