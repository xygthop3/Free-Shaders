
function scr_Grayscale_Create(){ 
  uni_grayscale_amount = shader_get_uniform(shd_Grayscale, "uni_grayscale_amount");
  var_grayscale_amount = 0.5;
}

function scr_Grayscale_Step(){
  if keyboard_check(ord("Q")) and var_grayscale_amount<1 var_grayscale_amount+=0.005;
  if keyboard_check(ord("A")) and var_grayscale_amount>0 var_grayscale_amount-=0.005;
  
  if keyboard_check(ord("R")) {var_grayscale_amount = 0.5; }
}

function scr_Grayscale_Draw() {
  shader_set_uniform_f(uni_grayscale_amount, var_grayscale_amount);
}

function scr_Grayscale_DrawGUI() {
  draw_text(0,0, "Grayscale amount (Q & A to adjust): "+string(var_grayscale_amount));
  draw_text(0,18, "Press R to reset to default setting");
}