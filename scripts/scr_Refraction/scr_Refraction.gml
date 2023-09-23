
function scr_Refraction_Create(){ 
  uni_refraction_resolution = shader_get_uniform(shd_Refraction ,"uni_refraction_resolution");
  uni_refraction_texture_resolution = shader_get_uniform(shd_Refraction ,"uni_refraction_textureRes");
  uni_refraction_texture_position = shader_get_uniform(shd_Refraction, "uni_refraction_texturePos");
  var_refraction_amount = 0.06;
  
  samp_refraction_normal_tex = shader_get_sampler_index(shd_Refraction, "samp_normalMap");
  samp_refraction_diffuse_tex = shader_get_sampler_index(shd_Refraction, "samp_diffuseTex");
  
  tex_refaction_normal_map = sprite_get_texture(spr_Refraction, 1);  
  tex_refaction_normal_map_width = sprite_get_width(spr_Refraction);
  tex_refaction_normal_map_height = sprite_get_height(spr_Refraction);
  
  tex_refaction_diffuse_color = sprite_get_texture(spr_Refraction, 0);
}

function scr_Refraction_Step(){
  if keyboard_check(ord("Q")) var_refraction_amount += 0.001;
  if keyboard_check(ord("A")) var_refraction_amount -= 0.001;

  if keyboard_check(ord("R")) {var_refraction_amount = 0.06;}
}

function scr_Refraction_Draw() {
  var_refraction_mouse_pos_x = mouse_x - (tex_refaction_normal_map_width/2);
  var_refraction_mouse_pos_y = mouse_y - (tex_refaction_normal_map_height/2);
  
  shader_set_uniform_f(uni_refraction_resolution, window_get_width(), window_get_height());
  shader_set_uniform_f(uni_refraction_texture_resolution, tex_refaction_normal_map_width, tex_refaction_normal_map_height);
  shader_set_uniform_f(uni_refraction_texture_position, var_refraction_mouse_pos_x, var_refraction_mouse_pos_y, var_refraction_amount);
  texture_set_stage(samp_refraction_normal_tex, tex_refaction_normal_map);
  texture_set_stage(samp_refraction_diffuse_tex, tex_refaction_diffuse_color);
  draw_surface_part(application_surface, var_refraction_mouse_pos_x, var_refraction_mouse_pos_y, tex_refaction_normal_map_width, tex_refaction_normal_map_height, var_refraction_mouse_pos_x, var_refraction_mouse_pos_y);
}

function scr_Refraction_DrawGUI() {
  draw_text(0,0, "Refraction offset (Q & A to adjust): "+string(var_refraction_amount));
  draw_text(0,18, "Press R to reset to default setting");
}