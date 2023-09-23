
function scr_Posterization_Create(){ 
  uni_Posterization_gamma = shader_get_uniform(shd_Posterization, "uni_Posterization_gamma");
  var_Posterization_gamma = 0.6;
  
  uni_Posterization_num_colors = shader_get_uniform(shd_Posterization, "uni_Posterization_num_colors");
  var_Posterization_num_colors = 8.0;
}

function scr_Posterization_Step(){
  if keyboard_check(ord("Q")) var_Posterization_gamma += 0.01;
  if keyboard_check(ord("A")) var_Posterization_gamma -= 0.01;
  
  if keyboard_check_pressed(ord("W")) var_Posterization_num_colors += 2;
  if keyboard_check_pressed(ord("S")) var_Posterization_num_colors -= 2;
  
  if keyboard_check(ord("R")) {var_Posterization_gamma = 0.6; var_Posterization_num_colors = 8.0;}
}

function scr_Posterization_Draw() {
  shader_set_uniform_f(uni_Posterization_gamma, var_Posterization_gamma);
  shader_set_uniform_f(uni_Posterization_num_colors, var_Posterization_num_colors);
}

function scr_Posterization_DrawGUI() {
  draw_text(0,0, "Gamma amount (Q & A to adjust): "+string(var_Posterization_gamma));
  draw_text(0,18, "Number of colors (W & S to adjust): "+string(var_Posterization_num_colors));
  draw_text(0,36, "Press R to reset to default setting");
}