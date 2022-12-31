base = {
	x: 256,
	y: 128
}

window_set_size(base.x * 5, base.y * 5);
surface_resize(application_surface, base.x, base.y);
display_set_gui_size(base.x, base.y);
application_surface_draw_enable(false);

parameters = {
	x: 1.00,	//start weight
	y: -1.10,	//weight decreate factor
	z: 0.75,	//max weight
	w: 0.03		//min weight
}

addition = 0.33;

uniforms = array_create(3);
uniforms[0] = shader_get_uniform(pp_scalehq4x, "dimensions");
uniforms[1] = shader_get_uniform(pp_scalehq4x, "parameters");
uniforms[2] = shader_get_uniform(pp_scalehq4x, "addition");

scale = 1;
image_speed = 0.15;
draw_set_font(font);

ppenable = false;