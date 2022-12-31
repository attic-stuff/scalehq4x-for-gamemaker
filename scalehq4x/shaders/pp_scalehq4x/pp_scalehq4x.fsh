varying vec2 vv_tex;
varying vec4 vv_col;

uniform vec2 dimensions;
uniform vec4 parameters;
uniform float addition;

void main() {

	vec2 a = 0.5 / dimensions;
	vec2 b = vec2(-a.x, a.y);
	
	vec2 c = a * 0.5;
	vec2 d = b * 0.5;
	
	vec2 e = vec2(a.x, 0.0);
	vec2 f = vec2(0.0, a.y);
	
	vec3 center = texture2D(gm_BaseTexture, vv_tex).rgb;
	
	vec3 i[4];
	i[0] = texture2D(gm_BaseTexture, vv_tex - c).rgb;
	i[1] = texture2D(gm_BaseTexture, vv_tex - d).rgb;
	i[2] = texture2D(gm_BaseTexture, vv_tex + c).rgb;
	i[3] = texture2D(gm_BaseTexture, vv_tex + d).rgb;
	
	vec3 o[4];
	o[0] = texture2D(gm_BaseTexture, vv_tex - a).rgb;
	o[1] = texture2D(gm_BaseTexture, vv_tex - b).rgb;
	o[2] = texture2D(gm_BaseTexture, vv_tex + a).rgb;
	o[3] = texture2D(gm_BaseTexture, vv_tex + b).rgb;
	
	vec3 s[4];
	s[0] = texture2D(gm_BaseTexture, vv_tex - f).rgb;
	s[1] = texture2D(gm_BaseTexture, vv_tex + e).rgb;
	s[2] = texture2D(gm_BaseTexture, vv_tex + f).rgb;
	s[3] = texture2D(gm_BaseTexture, vv_tex - e).rgb;
	
	vec3 white = vec3(1.0);
	
	float ko[4];
	ko[0] = dot(abs(o[0] - center), white);
	ko[1] = dot(abs(o[1] - center), white);
	ko[2] = dot(abs(o[2] - center), white);
	ko[3] = dot(abs(o[3] - center), white);
	
	float k1 = min(dot(abs(i[0] - i[2]), white), max(ko[0], ko[2]));
	float k2 = min(dot(abs(i[1] - i[3]), white), max(ko[1], ko[3]));
	
	float w[4];
	w[0] = k2;
		if (ko[2] < ko[0]) {
			w[0] = w[0] * (ko[2] / ko[0]);
		}
	
	w[1] = k1;
		if (ko[3] < ko[1]) {
			w[1] = w[1] * (ko[3] / ko[1]);
		}	

	w[2] = k2;
		if (ko[0] < ko[3]) {
			w[2] = w[2] * (ko[0] / ko[3]);
		}
		
	w[3] = k1;
		if (ko[1] < ko[3]) {
			w[3] = w[3] * (ko[1] / ko[3]);
		}
		
	center = (w[0] * o[0] + w[1] * o[1] + w[2] * o[2] + w[3] * o[3] + 0.001 * center) / (w[0] + w[1] + w[2] + w[3] + 0.001);
	
	w[0] = parameters.y * dot(abs(i[0] - center) + abs(i[2] - center), white) / (0.125 * dot(i[0] + i[2], white) + addition);
	w[1] = parameters.y * dot(abs(i[1] - center) + abs(i[3] - center), white) / (0.125 * dot(i[1] + i[3], white) + addition);
	w[2] = parameters.y * dot(abs(s[0] - center) + abs(s[2] - center), white) / (0.125 * dot(s[0] + s[2], white) + addition);
	w[3] = parameters.y * dot(abs(s[1] - center) + abs(s[3] - center), white) / (0.125 * dot(s[1] + s[3], white) + addition);
	
	w[0] = clamp(w[0] + parameters.x, parameters.w, parameters.z);
	w[1] = clamp(w[1] + parameters.x, parameters.w, parameters.z);
	w[2] = clamp(w[2] + parameters.x, parameters.w, parameters.z);
	w[3] = clamp(w[3] + parameters.x, parameters.w, parameters.z);
	
	vec3 pixel = (w[0] * (i[0] + i[2]) + w[1] * (i[1] + i[3]) + w[2] * (s[0] + s[2]) + w[3] * (s[1] + s[3]) + center) / (2.0 * (w[0] + w[1] + w[2] + w[3]) + 1.0);
	
	gl_FragColor = vec4(pixel * vv_col.rgb, 1.0 * vv_col.a);
}
