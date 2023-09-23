
function scr_LED_Effect_Create(){ 
  uni_led_resolution = shader_get_uniform(shd_LED_effect, "uni_resolution");
  
  uni_led_size = shader_get_uniform(shd_LED_effect, "uni_led_size");
  var_led_size = 100;
  
  uni_led_brightness = shader_get_uniform(shd_LED_effect, "uni_led_brightness");
  var_led_brightness = 1.0;
}

function scr_LED_Effect_Step(){
  if keyboard_check(ord("Q")) var_led_size -= 1;
  if keyboard_check(ord("A")) var_led_size += 1;
  
  if keyboard_check(ord("W")) var_led_brightness += 0.01;
  if keyboard_check(ord("S")) and var_led_brightness > 0.5 var_led_brightness -= 0.01;
  
  if keyboard_check(ord("R")) {var_led_size = 100; var_led_brightness = 1.0;}
}

function scr_LED_Effect_Draw() {
  shader_set_uniform_f(uni_led_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_led_size, var_led_size);
  shader_set_uniform_f(uni_led_brightness, var_led_brightness);
}

function scr_LED_Effect_DrawGUI() {
  draw_text(0,0, "LED size (Q & A to adjust): "+string(var_led_size));
  draw_text(0,18, "LED Brightness (W & S to adjust): "+string(var_led_brightness));
  draw_text(0,36, "Press R to reset to default setting");
}