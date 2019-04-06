shader_type canvas_item;

uniform vec4 tint : hint_color;
uniform vec2 sprite_scale;
uniform float x_scale = 0.67;
uniform float highlight_thickness = 0.2;
uniform float wave_reduction = 100;

float rand(vec2 coord) {
	return fract(sin(dot(coord, vec2(12.9898, 78.233))) * 43758.5453123);
}

float noise (vec2 coord) {
	vec2 i = floor(coord);
	vec2 f = fract(coord);
	
	float a = rand(i);
	float b = rand(i + vec2(1., 0.));
	float c = rand(i + vec2(0., 1.));
	float d = rand(i + vec2(1., 1.));
	
	vec2 cubic = f * f * (3. - 2. * f);
	return mix(a,b,cubic.x) + (c-a) * cubic.y * (1. - cubic.x) + (d-b) * cubic.x * cubic.y;
}

void fragment () {
	vec2 coord1 = UV * sprite_scale * x_scale;
	vec2 coord2 = UV * sprite_scale * x_scale + 4.;
	
	vec2 motion1 = vec2(TIME * 0.3, TIME * -0.4);
	vec2 motion2 = vec2(TIME * 0.1, TIME * 0.5);
	
	vec2 distort1 = vec2(noise(coord1 + motion1), noise(coord2 + motion1)) - vec2(0.5);
	vec2 distort2 = vec2(noise(coord1 + motion2), noise(coord2 + motion2)) - vec2(0.5);
	
	vec2 sum_distorts = (distort1 + distort2) / wave_reduction;
	
	vec4 color = textureLod(SCREEN_TEXTURE, SCREEN_UV + sum_distorts, 0.);
	color = mix (color, tint, 0.3);
	color.rgb = mix(vec3(0.5), color.rgb, 1.4);
	
	float top_highlight = (UV.y + sum_distorts.y) * sprite_scale.y / highlight_thickness;
	top_highlight = 1. - clamp(top_highlight, 0., 1.);
	
	color = mix(color, vec4(1.), top_highlight);
	color.a = 1. - smoothstep(0.6, 0.7, top_highlight);
	
	
	
	COLOR = color;
}