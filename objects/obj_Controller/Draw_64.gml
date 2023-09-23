 
draw_text(600,0,  "Real FPS: "+string(fps_real));
draw_text(600,18, "Press SPACE to change shaders");
draw_text(600,36, "Active Shader: "+(shader_enabled ? shader_get_name(shader_active) : "shd_Passthrough"));
draw_text(600,54, "Press SHIFT to enable/disable shader");
draw_text(600,72, "Shader enabled: "+(shader_enabled ? "True" : "False"));

//Draw GUI controls for current active shader
switch (shader_get_name(shader_active)) {
  case "shd_Brightness_Contrast": scr_Brightness_Contrast_DrawGUI(); break;
  case "shd_Grayscale": scr_Grayscale_DrawGUI(); break;
  case "shd_LED_effect": scr_LED_Effect_DrawGUI(); break;
  case "shd_Magnify": scr_Magnify_DrawGUI(); break;
  case "shd_Mosaic": scr_Mosaic_DrawGUI(); break;
  case "shd_Posterization": scr_Posterization_DrawGUI(); break;
  case "shd_Radial_Blur": scr_Radial_Blur_DrawGUI(); break;
  case "shd_Refraction": scr_Refraction_DrawGUI(); break;
  case "shd_Ripple": scr_Ripple_DrawGUI(); break;
  case "shd_Sepia": scr_Sepia_DrawGUI(); break;
  case "shd_Shockwave": scr_Shockwave_DrawGUI(); break;
  case "shd_Sketch": scr_Sketch_DrawGUI(); break;
  case "shd_Wave": scr_Wave_DrawGUI(); break;
  //case "shd_*": scr_*_DrawGUI(); break;
}