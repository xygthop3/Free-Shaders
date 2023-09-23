
function scr_Shockwave_Create(){ 
  uni_shockwave_time = shader_get_uniform(shd_Shockwave, "uni_shockwave_time");
  var_shockwave_time = 0;
  
  uni_shockwave_mouse_pos = shader_get_uniform(shd_Shockwave, "uni_shockwave_mouse_pos");
  var_shockwave_mouse_x = mouse_x;
  var_shockwave_mouse_y = mouse_y;
  
  uni_shockwave_resolution = shader_get_uniform(shd_Shockwave, "uni_shockwave_resolution");
  
  uni_shockwave_amplitude = shader_get_uniform(shd_Shockwave, "uni_shockwave_amplitude");
  var_shockwave_amplitude = 10;
  
  uni_shockwave_refraction = shader_get_uniform(shd_Shockwave, "uni_shockwave_refraction");
  var_shockwave_refraction = 0.8;
  
  uni_shockwave_width = shader_get_uniform(shd_Shockwave, "uni_shockwave_width");
  var_shockwave_width = 0.1;
  
  var_shockwave_enabled = false;
}

function scr_Shockwave_Step() {
  if keyboard_check(ord("Q")) var_shockwave_amplitude += 0.5;
  if keyboard_check(ord("A")) var_shockwave_amplitude -= 0.5;
  
  if keyboard_check(ord("W")) var_shockwave_refraction += 0.05;
  if keyboard_check(ord("S")) var_shockwave_refraction -= 0.05;
  
  if keyboard_check(ord("E")) var_shockwave_width += 0.001;
  if keyboard_check(ord("D")) var_shockwave_width -= 0.001;
  
  if mouse_check_button_released(mb_left) {
	var_shockwave_enabled = false;
	var_shockwave_time = 0;
	  
    var_shockwave_enabled = true;
	var_shockwave_mouse_x = mouse_x;
    var_shockwave_mouse_y = mouse_y;
    alarm[0] = 280;
  }
  
    if keyboard_check(ord("R")) {var_shockwave_time = 0; var_shockwave_amplitude = 10; var_shockwave_refraction = 0.8; var_shockwave_width = 0.1;}
}

function scr_Shockwave_Alarm0() {
  var_shockwave_enabled = false;
  var_shockwave_time = 0;
}

function scr_Shockwave_Draw() {
  if var_shockwave_enabled { var_shockwave_time += 0.008; }
  else { shader_reset(); }
  shader_set_uniform_f(uni_shockwave_time, var_shockwave_time);
  shader_set_uniform_f(uni_shockwave_mouse_pos, var_shockwave_mouse_x, var_shockwave_mouse_y);
  shader_set_uniform_f(uni_shockwave_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_shockwave_amplitude, var_shockwave_amplitude);
  shader_set_uniform_f(uni_shockwave_refraction, var_shockwave_refraction);
  shader_set_uniform_f(uni_shockwave_width, var_shockwave_width);
}

function scr_Shockwave_DrawGUI() {
  draw_text(0,0, "Shockwave amplitude (Q & A to adjust): "+string(var_shockwave_amplitude));
  draw_text(0,18, "Shockwave refraction (W & S to adjust): "+string(var_shockwave_refraction));
  draw_text(0,36, "Shockwave width (E & D to adjust): "+string(var_shockwave_width));
  draw_text(0,54, "Press R to reset to default setting");
}