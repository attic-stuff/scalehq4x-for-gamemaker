var mouse = mouse_wheel_up() - mouse_wheel_down();

if (keyboard_check(ord("X"))) {
	var factor = mouse * 0.1;
	parameters.x = clamp(parameters.x + factor, -5, 5);
}

if (keyboard_check(ord("Y"))) {
	var factor = mouse * 0.1;
	parameters.y = clamp(parameters.y + factor, -5, 5);	
}

if (keyboard_check(ord("Z"))) {
	var factor = mouse * 0.01;
	parameters.z = clamp(parameters.z + factor, parameters.w, 5);	
}


if (keyboard_check(ord("W"))) {
	var factor = mouse * 0.01;
	parameters.w = clamp(parameters.w + factor, -5, 5);	
}

if (keyboard_check(ord("A"))) {
	var factor = mouse * 0.01;
	addition = clamp(addition + factor, -5, 5);	
}

if (keyboard_check(ord("D"))) {
	parameters = {
		x: 1.00,
		y: -1.10,
		z: 0.75,
		w: 0.03
	}
	addition = 0.33;	
}

ppenable = keyboard_check_pressed(vk_space) ? !ppenable : ppenable;