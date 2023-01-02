var instructions = "hold button and scroll the m. wheel to change stuff! press [D] to reset and press [SPACE] to turn this on or off!!\n[X]start weight: " + string(parameters.x) + "\n[Y]decrease factor: " + string(parameters.y) + "\n[Z]max weight: " + string(parameters.z) + "\n[W]min weight: " + string(parameters.w) + "\n[A]addition: " + string(addition);
draw_set_color(#080808);
draw_text_ext(2,-2, instructions, 10, 230);
draw_set_color(#dbd2b8);
draw_text_ext(2,-3, instructions, 10, 230);
draw_set_color(#ffffff);
draw_self();