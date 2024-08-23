// version: 1.0 (modified)
// repository: https://github.com/TABmk/godot-2d-shadow-shader

shader_type canvas_item;

uniform vec2 offset = vec2(-10.0, -10.0);
uniform vec4 color : source_color;
uniform bool debug = false;

vec4 hideTrail(vec2 uv, sampler2D txtr, bool isMain) {
	if (uv.x >= 0.0 && uv.x <= 1.0 && uv.y >= 0.0 && uv.y <= 1.0) {
		vec4 texColor = texture(txtr, uv);
		return isMain ? texColor : vec4(color.rgb, texColor.a - (1.0 - color.a));
	}
	return vec4(0.0);
}

void fragment() {
	vec2 singlePX = TEXTURE_PIXEL_SIZE;

	vec4 uv_texture = hideTrail(UV, TEXTURE, true) * COLOR;

	vec2 shadow_uv = UV + offset * singlePX;
	vec4 shadow = hideTrail(shadow_uv, TEXTURE, false);

	vec4 res = mix(shadow, uv_texture, uv_texture.a);
	vec4 debug_layer = vec4(1.0, 0.0, 0.0, 0.3);
	COLOR = mix(debug ? debug_layer : res, res, res.a);
}
