
//Check active shader for key presses and update uniforms
switch (shader_get_name(shader_active)) {
  case "shd_Brightness_Contrast": scr_Brightness_Contrast_Step(); break;
  case "shd_Grayscale": scr_Grayscale_Step(); break;
  case "shd_LED_effect": scr_LED_Effect_Step(); break;
  case "shd_Magnify": scr_Magnify_Step(); break;
  case "shd_Mosaic": scr_Mosaic_Step(); break;
  case "shd_Posterization": scr_Posterization_Step(); break;
  case "shd_Radial_Blur": scr_Radial_Blur_Step(); break;
  case "shd_Refraction": scr_Refraction_Step(); break;
  case "shd_Ripple": scr_Ripple_Step(); break;
  case "shd_Sepia": scr_Sepia_Step(); break;
  case "shd_Shockwave": scr_Shockwave_Step(); break;
  case "shd_Sketch": scr_Sketch_Step(); break;
  case "shd_Wave": scr_Wave_Step(); break;
  //case "shd_*": scr_*_Step(); break;
}