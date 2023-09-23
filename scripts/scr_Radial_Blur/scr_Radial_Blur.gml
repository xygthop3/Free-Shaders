
function scr_Radial_Blur_Create(){ 
  uni_radial_mouse_pos = shader_get_uniform(shd_Radial_Blur, "uni_radial_mouse_pos");
  uni_radial_blur_resolution = shader_get_uniform(shd_Radial_Blur, "uni_radial_resolution");
  
  uni_radial_blur_offset = shader_get_uniform(shd_Radial_Blur, "uni_radial_blur_offset");
  var_radial_blur_offset = 0.15;
  
  uni_radial_brightness = shader_get_uniform(shd_Radial_Blur, "uni_radial_brightness");
  var_radial_brightness = 1;
}

function scr_Radial_Blur_Step(){
  if keyboard_check(ord("Q")) var_radial_blur_offset += 0.01;
  if keyboard_check(ord("A")) var_radial_blur_offset -= 0.01;
  
  if keyboard_check(ord("W")) var_radial_brightness += 0.01;
  if keyboard_check(ord("S")) var_radial_brightness -= 0.01;
  
  if keyboard_check(ord("R")) {var_radial_blur_offset = 0.15; var_radial_brightness = 1;}
}

function scr_Radial_Blur_Draw() {
  shader_set_uniform_f(uni_radial_mouse_pos, mouse_x, mouse_y);
  shader_set_uniform_f(uni_radial_blur_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_radial_blur_offset, var_radial_blur_offset);
  shader_set_uniform_f(uni_radial_brightness, var_radial_brightness);
}

function scr_Radial_Blur_DrawGUI() {
  draw_text(0,0, "Blur offset (Q & A to adjust): "+string(var_radial_blur_offset));
  draw_text(0,18, "Blur brightness (E & D to adjust): "+string(var_radial_brightness));
  draw_text(0,36, "Press R to reset to default setting");
}