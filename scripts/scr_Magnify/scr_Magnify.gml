
function scr_Magnify_Create(){ 
  uni_magnify_mouse_pos = shader_get_uniform(shd_Magnify, "uni_magnify_mouse_pos");
  uni_magnify_resolution = shader_get_uniform(shd_Magnify,"uni_magnify_resolution");
  
  uni_magnify_circleRadius = shader_get_uniform(shd_Magnify,"uni_magnify_circleRadius");
  var_magnify_circle_radius = 0.25;
  
  uni_magnify_minZoom = shader_get_uniform(shd_Magnify,"uni_magnify_minZoom");
  var_magnify_circle_zoom_min = 0.4;
  
  uni_magnify_maxZoom = shader_get_uniform(shd_Magnify,"uni_magnify_maxZoom");
  var_magnify_circle_zoom_max = 0.6;
}

function scr_Magnify_Step(){
  if keyboard_check(ord("Q")) var_magnify_circle_radius += 0.01;
  if keyboard_check(ord("A")) var_magnify_circle_radius -= 0.01;
  
  if keyboard_check(ord("W")) var_magnify_circle_zoom_min -= 0.01;
  if keyboard_check(ord("S")) var_magnify_circle_zoom_min += 0.01;
  
  if keyboard_check(ord("E")) var_magnify_circle_zoom_max -= 0.01;
  if keyboard_check(ord("D")) var_magnify_circle_zoom_max += 0.01;
  
  if keyboard_check(ord("R")) {var_magnify_circle_radius = 0.25; var_magnify_circle_zoom_min = 0.4; var_magnify_circle_zoom_max = 0.6;}
}

function scr_Magnify_Draw() {
  shader_set_uniform_f(uni_magnify_mouse_pos, mouse_x, mouse_y);
  shader_set_uniform_f(uni_magnify_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_magnify_circleRadius, var_magnify_circle_radius);
  shader_set_uniform_f(uni_magnify_minZoom, var_magnify_circle_zoom_min);
  shader_set_uniform_f(uni_magnify_maxZoom, var_magnify_circle_zoom_max);
}

function scr_Magnify_DrawGUI() {
  draw_text(0,0, "Circle radius (Q & A to adjust): "+string(var_magnify_circle_radius));
  draw_text(0,18, "Minimum zoom (W & S to adjust): "+string(var_magnify_circle_zoom_min));
  draw_text(0,36, "Maximum zoom (E & D to adjust): "+string(var_magnify_circle_zoom_max));
  draw_text(0,54, "Press R to reset to default setting");
}