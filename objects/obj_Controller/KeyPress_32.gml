/// @description Change Shader

shader_name_from_list += 1;

if (shader_name_from_list < shader_list_size) {
  shader_active = ds_list_find_value(shader_list, shader_name_from_list);
}
else {
 shader_name_from_list = 0;
 shader_active = ds_list_find_value(shader_list, shader_name_from_list);
}