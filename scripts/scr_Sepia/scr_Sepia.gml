
function scr_Sepia_Create(){ 
  uni_sepia_amount = shader_get_uniform(shd_Sepia, "uni_sepia_amount");
  var_sepia_amount = 0.80;
}

function scr_Sepia_Step() {
  if keyboard_check(ord("Q")) {if var_sepia_amount <1 var_sepia_amount += 0.01};
  if keyboard_check(ord("A")) {if var_sepia_amount >0 var_sepia_amount -= 0.01};
  if keyboard_check(ord("R")) {var_sepia_amount = 0.80;}
}

function scr_Sepia_Draw() {
  shader_set_uniform_f(uni_sepia_amount, var_sepia_amount);
}

function scr_Sepia_DrawGUI() {
  draw_text(0,0, "Sepia strength (Q & A to adjust): "+string(var_sepia_amount));
  draw_text(0,18, "Press R to reset to default setting");
}