uniform sampler2D niri_tex;
uniform mat3 niri_window_geo_to_tex;
uniform vec2 size_geo;
uniform float niri_progress;
void main() {
    vec2 geo_coord = gl_FragCoord.xy;
    float scale = mix(0.7, 1.0, niri_progress); // Zoom from 70% to 100%
    vec2 center = size_geo * 0.5;
    vec2 coord = geo_coord - center;
    coord = coord / scale + center;
    vec3 tex_coord = vec3(coord, 1.0) * niri_window_geo_to_tex;
    gl_FragColor = texture2D(niri_tex, tex_coord.xy / tex_coord.z);
}