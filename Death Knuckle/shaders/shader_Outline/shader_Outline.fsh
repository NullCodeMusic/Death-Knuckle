//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;
void main()
{
	vec2 offsetx;
	offsetx.x = pixelW;
	offsetx.y =0;
	vec2 offsety;
	offsety.x = 0;
	offsety.y = pixelH;
	
	//
	
	float alpha =0 ;//= texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord + offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord - offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord + offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord - offsety).a);
	
	vec2 offsetx1; 
	vec2 offsety1;
	// asdfjaslfaes ADD ONE TO MAKE A 2 pixel shader
	
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord + offsetx1).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord - offsetx1).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord + offsety1).a);
	alpha += ceil(texture2D(gm_BaseTexture,v_vTexcoord - offsety1).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//if (alpha == 0) {
	//gl_FragColor.rgb = gl_FragColor.rgb * new vec3{2,0,1};	
	//}
	
	gl_FragColor.a=alpha;
	
}
