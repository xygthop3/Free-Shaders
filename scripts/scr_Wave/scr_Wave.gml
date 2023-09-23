
function scr_Wave_Create(){ 
  uni_wave_time = shader_get_uniform(shd_Wave, "uni_wave_time");
  var_wave_time = 0;
    
  uni_wave_amount = shader_get_uniform(shd_Wave, "uni_wave_amount");
  var_wave_amount = 20; //higher = more waves
  
  uni_wave_distortion = shader_get_uniform(shd_Wave, "uni_wave_distortion");
  var_wave_distortion = 30; //higher = less distortion
  
  uni_wave_speed = shader_get_uniform(shd_Wave, "uni_wave_speed");
  var_wave_speed = 2.0; //higher = faster
}

function scr_Wave_Step() {
  if keyboard_check(ord("Q")) var_wave_amount += 0.5;
  if keyboard_check(ord("A")) var_wave_amount -= 0.5;
  
  if keyboard_check(ord("W")) var_wave_distortion += 0.5;
  if keyboard_check(ord("S")) var_wave_distortion -= 0.5;
  
  if keyboard_check(ord("E")) var_wave_speed += 0.5;
  if keyboard_check(ord("D")) var_wave_speed -= 0.5;
  if keyboard_check(ord("R")) {var_wave_time = 0; var_wave_amount = 20; var_wave_distortion = 30; var_wave_speed = 2.0;}
}

function scr_Wave_Draw() {
  var_wave_time+=0.04;
  shader_set_uniform_f(uni_wave_time, var_wave_time);
  shader_set_uniform_f(uni_wave_amount, var_wave_amount);
  shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
  shader_set_uniform_f(uni_wave_speed, var_wave_speed);
}

function scr_Wave_DrawGUI() {
  draw_text(0,0, "Wave amount (Q & A to adjust): "+string(var_wave_amount));
  draw_text(0,18, "Wave distortion (W & S to adjust): "+string(var_wave_distortion));
  draw_text(0,36, "Wave speed (E & D to adjust): "+string(var_wave_speed));
  draw_text(0,54, "Press R to reset to default setting");
}