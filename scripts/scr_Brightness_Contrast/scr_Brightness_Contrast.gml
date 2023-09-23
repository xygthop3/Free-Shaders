
function scr_Brightness_Contrast_Create(){ 
  uni_Brightness_Amount = shader_get_uniform(shd_Brightness_Contrast, "uni_brightness_amount");
  var_Brightness_Amount = 0.2;
  
  uni_Contrast_Amount = shader_get_uniform(shd_Brightness_Contrast, "uni_contrast_amount");
  var_Contrast_Amount = 0.2;
}

function scr_Brightness_Contrast_Step(){
  if keyboard_check(ord("Q")) and var_Brightness_Amount < 1 var_Brightness_Amount += 0.01;
  if keyboard_check(ord("A")) and var_Brightness_Amount > -1 var_Brightness_Amount -= 0.01;
  
  if keyboard_check(ord("W")) and var_Contrast_Amount < 1 var_Contrast_Amount += 0.01;
  if keyboard_check(ord("S")) and var_Contrast_Amount > -1 var_Contrast_Amount -= 0.01;
  
  if keyboard_check(ord("R")) {var_Brightness_Amount = 0.2; var_Contrast_Amount = 0.2;}
}

function scr_Brightness_Contrast_Draw() {
  shader_set_uniform_f(uni_Brightness_Amount, var_Brightness_Amount);
  shader_set_uniform_f(uni_Contrast_Amount, var_Contrast_Amount );
}

function scr_Brightness_Contrast_DrawGUI() {
  draw_text(0,0, "Brightness amount (Q & A to adjust): " +string(var_Brightness_Amount));
  draw_text(0,18, "Contrast amount (W & S to adjust): "  +string(var_Contrast_Amount));
  draw_text(0,36, "Press R to reset to default setting");
}