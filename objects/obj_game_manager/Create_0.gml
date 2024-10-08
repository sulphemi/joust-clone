function refresh_room() {
	// destroy all gameplatforms
	instance_destroy(obj_gameplatform);
	
	// make bricklayers
	instance_create_layer(32 * irandom_range(0, 43), 128, "layer_platforms", obj_bricklayer);
	instance_create_layer(32 * irandom_range(0, 43), 320, "layer_platforms", obj_bricklayer);
	instance_create_layer(32 * irandom_range(0, 43), 512, "layer_platforms", obj_bricklayer);
	
	// summon monsters
	for (var i = 0; i < 4; i++) instance_create_layer(random(room_width), random(room_height), "layer_entities", obj_spawn_animation);
	
	ready = false;
}

ready = true;