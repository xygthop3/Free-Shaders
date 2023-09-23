
function scr_Scanlines_Create(){ 
  uni_scanlines_resolution = shader_get_uniform(shd_Scanlines, "uni_scanlines_resolution");
}


function scr_Scanlines_Draw() {
    shader_set_uniform_f(uni_scanlines_resolution, window_get_width(), window_get_height());
}