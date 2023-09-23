
function scr_Sketch_Create(){ 
  uni_Sketch_Resolution = shader_get_uniform(shd_Sketch, "uni_Sketch_Resolution");
  
  uni_Sketch_Intensity = shader_get_uniform(shd_Sketch,"uni_Sketch_Intensity");
  var_Sketch_Intensity = 0.5;
}

function scr_Sketch_Step() {
  if keyboard_check(ord("Q")) var_Sketch_Intensity += 0.01;
  if keyboard_check(ord("A")) var_Sketch_Intensity -= 0.01;
  if keyboard_check(ord("R")) {var_Sketch_Intensity = 0.5;}
}

function scr_Sketch_Draw() {
  shader_set_uniform_f(uni_Sketch_Resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_Sketch_Intensity, var_Sketch_Intensity);
}

function scr_Sketch_DrawGUI() {
  draw_text(0,0, "Intensity(Q & A to adjust): "+string(var_Sketch_Intensity));
  draw_text(0,18, "Press R to reset to default setting");
}