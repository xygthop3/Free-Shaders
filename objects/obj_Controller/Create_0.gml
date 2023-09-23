
application_surface_draw_enable(false);

//Add all shaders to a list and load all shader uniforms
shader_list = ds_list_create();
  ds_list_add(shader_list, shd_Passthrough);
  //no create event required for Passthrough
  
  ds_list_add(shader_list, shd_Brightness_Contrast);
    scr_Brightness_Contrast_Create();
	
  ds_list_add(shader_list, shd_Emboss);
    scr_Emboss_Create();
	
  ds_list_add(shader_list, shd_Grayscale);
    scr_Grayscale_Create();
	
  ds_list_add(shader_list, shd_Invert_Colors);
  //no create event required for Invery Colours
  
  ds_list_add(shader_list, shd_LED_effect);
    scr_LED_Effect_Create();
	
  ds_list_add(shader_list, shd_Magnify);
    scr_Magnify_Create();
	
  ds_list_add(shader_list, shd_Mosaic);
    scr_Mosaic_Create();
  
  ds_list_add(shader_list, shd_Posterization);
  scr_Posterization_Create();
  
  ds_list_add(shader_list, shd_Radial_Blur);
    scr_Radial_Blur_Create();
	
  ds_list_add(shader_list, shd_Refraction);
    scr_Refraction_Create();
  
  ds_list_add(shader_list, shd_Ripple);
    scr_Ripple_Create();
	
  ds_list_add(shader_list, shd_Scanlines);
    scr_Scanlines_Create();
	
  ds_list_add(shader_list, shd_Sepia);
    scr_Sepia_Create();
	
  ds_list_add(shader_list, shd_Shockwave);
    scr_Shockwave_Create();
	
  ds_list_add(shader_list, shd_Sketch);
    scr_Sketch_Create();
  
  ds_list_add(shader_list, shd_Thermal);
  //no create event required for Thermal
  
  ds_list_add(shader_list, shd_Wave);
    scr_Wave_Create();
  
shader_list_size = ds_list_size(shader_list);


shader_enabled = true;
shader_name_from_list = 0;
shader_active = ds_list_find_value(shader_list, shader_name_from_list);