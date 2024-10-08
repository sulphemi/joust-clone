if (room == rm_start) {
	if (keyboard_check_pressed(START)) {
		room = rm_game;	
	}
	
	if (keyboard_check_pressed(TUTORIAL)) {
		room = rm_tutorial;
	}
}

if (room == rm_end) {
	if (keyboard_check_pressed(START)) {
		room = rm_start;	
	}
}

if (room == rm_tutorial) {
	if (keyboard_check_pressed(vk_anykey)) {
		room = rm_start;	
	}
}