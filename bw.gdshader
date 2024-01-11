shader_type canvas_item;
 
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;
 
void fragment() {
    vec3 pixel = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
    float color =(pixel.r + pixel.g + pixel.b) * 0.33;
    pixel.r = color;
    pixel.g = color;
    pixel.b = color;
    COLOR.rgb = pixel;
}
