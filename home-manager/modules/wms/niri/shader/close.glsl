uniform sampler2D niri_tex;
uniform mat3 niri_window_geo_to_tex;
uniform vec2 size_geo;
uniform float niri_progress;
void main() {
    vec2 geo_coord = gl_FragCoord.xy;
    float scale = mix(1.0, 0.8, niri_progress); // Shrink to 80%
    float alpha = mix(1.0, 0.0, niri_progress); // Fade out
    vec2 center = size_geo * 0.5;
    vec2 coord = geo_coord - center;
    coord = coord * scale + center;
    vec3 tex_coord = vec3(coord, 1.0) * niri_window_geo_to_tex;
    vec4 color = texture2D(niri_tex, tex_coord.xy / tex_coord.z);
    gl_FragColor = vec4(color.rgb, color.a * alpha);
}