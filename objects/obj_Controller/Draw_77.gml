
if (shader_enabled) {
  if (shader_get_name(shader_active) != "shd_Refraction") {
	  
	shader_set(shader_active);
  
   //Apply shader uniforms to current active shader
    switch (shader_get_name(shader_active)) {
      case "shd_Brightness_Contrast": scr_Brightness_Contrast_Draw(); break;
	  case "shd_Emboss": scr_Emboss_Draw(); break;
	  case "shd_Grayscale": scr_Grayscale_Draw(); break;
	  case "shd_LED_effect": scr_LED_Effect_Draw(); break;
	  case "shd_Magnify": scr_Magnify_Draw(); break;
	  case "shd_Mosaic": scr_Mosaic_Draw(); break;
	  case "shd_Posterization": scr_Posterization_Draw(); break;
	  case "shd_Radial_Blur": scr_Radial_Blur_Draw(); break;
	  case "shd_Ripple": scr_Ripple_Draw(); break;
	  case "shd_Scanlines": scr_Scanlines_Draw(); break;
	  case "shd_Sepia": scr_Sepia_Draw(); break;
	  case "shd_Shockwave": scr_Shockwave_Draw(); break;
	  case "shd_Sketch": scr_Sketch_Draw(); break;
	  case "shd_Wave": scr_Wave_Draw(); break;
	  //case "shd_*": scr_*_Draw(); break;
    }

    //Draw the world
    draw_surface(application_surface, 0,0);
	
  shader_reset();
  }
  else {
    if (shader_get_name(shader_active) == "shd_Refraction") {
      //Draw the world
      draw_surface(application_surface, 0,0);
	    shader_set(shader_active);
	      scr_Refraction_Draw();
		shader_reset();
	}
  }
}
else {
 shader_set(shd_Passthrough);
   draw_surface(application_surface, 0,0);
 shader_reset();
}
