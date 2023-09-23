
function scr_Emboss_Create(){ 
  uni_emboss_resolution = shader_get_uniform(shd_Emboss, "uni_resolution");
}

function scr_Emboss_Draw() {
  shader_set_uniform_f(uni_emboss_resolution, window_get_width(), window_get_height());
}
