
function scr_Ripple_Create(){ 
  uni_ripple_time = shader_get_uniform(shd_Ripple, "uni_ripple_time");
  var_ripple_time = 0;
  
  uni_ripple_mouse_pos = shader_get_uniform(shd_Ripple, "uni_ripple_mouse_pos");
  uni_ripple_resolution = shader_get_uniform(shd_Ripple, "uni_ripple_resolution");
  
  uni_ripple_wave_amount = shader_get_uniform(shd_Ripple, "uni_ripple_wave_amount");
  var_ripple_wave_amount = 80; //higher = more waves
  
  uni_ripple_wave_distortion = shader_get_uniform(shd_Ripple, "uni_ripple_wave_distortion");
  var_ripple_wave_distortion = 30; //higher = less distortion
  
  uni_ripple_wave_speed = shader_get_uniform(shd_Ripple, "uni_ripple_wave_speed");
  var_ripple_wave_speed = 5.0; //higher = faster
}

function scr_Ripple_Step(){
  if keyboard_check(ord("Q")) var_ripple_wave_amount += 1;
  if keyboard_check(ord("A")) var_ripple_wave_amount -= 1;
  
  if keyboard_check(ord("W")) var_ripple_wave_distortion += 0.5;
  if keyboard_check(ord("S")) var_ripple_wave_distortion -= 0.5;
  
  if keyboard_check(ord("E")) var_ripple_wave_speed += 0.1;
  if keyboard_check(ord("D")) var_ripple_wave_speed -= 0.1;
  
  if keyboard_check(ord("R")) {var_ripple_wave_amount = 80; var_ripple_wave_distortion = 30; var_ripple_wave_speed = 5.0; var_ripple_time = 0;}
}

function scr_Ripple_Draw() {
  var_ripple_time+=0.04;
  shader_set_uniform_f(uni_ripple_time, var_ripple_time);
  shader_set_uniform_f(uni_ripple_mouse_pos, mouse_x, mouse_y);
  shader_set_uniform_f(uni_ripple_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_ripple_wave_amount, var_ripple_wave_amount);
  shader_set_uniform_f(uni_ripple_wave_distortion, var_ripple_wave_distortion );
  shader_set_uniform_f(uni_ripple_wave_speed, var_ripple_wave_speed);
}

function scr_Ripple_DrawGUI() {
  draw_text(0,0, "Wave amount (Q & A to adjust): "+string(var_ripple_wave_amount));
  draw_text(0,18, "Wave distortion (W & S to adjust): "+string(var_ripple_wave_distortion));
  draw_text(0,36, "Wave speed (E & D to adjust): "+string(var_ripple_wave_speed));
  draw_text(0,54, "Press R to reset to default setting");
}