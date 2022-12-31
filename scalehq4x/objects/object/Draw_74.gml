if (ppenable == true) {
	shader_set(pp_scalehq4x) {
		//this uniform is the dimensions of your application surface. this is raw size.
		//so if you're drawing your application surface scaled, you do not put the scaled size
		//just the raw size. if you're messing with your app surface size a lot, replace constants
		//with surface_get_width/height(app surface)
		shader_set_uniform_f(uniforms[0], base.x, base.y);
		//these are the parameters of the smoothing
		shader_set_uniform_f(uniforms[1], parameters.x, parameters.y, parameters.z, parameters.w);
		//this is the additional luminance
		shader_set_uniform_f(uniforms[2], addition);
		//this is your brain on drugs
		draw_surface(application_surface, 0, 0);
		shader_reset();
	}
} else {
	draw_surface(application_surface, 0, 0);
}