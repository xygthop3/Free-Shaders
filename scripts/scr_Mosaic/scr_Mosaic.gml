
function scr_Mosaic_Create(){ 
  uni_mosaic_resolution = shader_get_uniform(shd_Mosaic,"uni_mosaic_resolution");
  
  uni_mosaic_pixel_amount = shader_get_uniform(shd_Mosaic, "uni_mosaic_pixel_amount");
  var_mosaic_pixel_amount = 200.0;
}

function scr_Mosaic_Step(){
  if keyboard_check(ord("Q")) var_mosaic_pixel_amount += 1;
  if keyboard_check(ord("A")) var_mosaic_pixel_amount -= 1;
  
  if keyboard_check(ord("R")) {var_mosaic_pixel_amount = 200;}
}

function scr_Mosaic_Draw() {
  shader_set_uniform_f(uni_mosaic_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_mosaic_pixel_amount, var_mosaic_pixel_amount );
}

function scr_Mosaic_DrawGUI() {
draw_text(0,0, "Pixel amount (Q & A to adjust): "+string(var_mosaic_pixel_amount));
  draw_text(0,18, "Press R to reset to default setting");
}