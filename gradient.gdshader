shader_type spatial;

void fragment() {
	ALBEDO = vec3(UV.x, UV.y, 0.0);
	ALPHA = 0.8;
}
