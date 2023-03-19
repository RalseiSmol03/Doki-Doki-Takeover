package shaders;

import flixel.system.FlxAssets.FlxShader;

class InvertShader extends FlxShader
{
	@:glFragmentSource('
	#pragma header
	#define texture flixel_texture2D
	#define iChannel0 bitmap
	#define fragColor gl_FragColor
	void main()
	{
		vec2 uv = openfl_TextureCoordv.xy;
		vec4 baseTexture = texture(iChannel0, uv) / openfl_Alphav;
		float alpha = baseTexture.a * openfl_Alphav;

		fragColor = vec4((vec3(1, 1, 1) - baseTexture.rgb) * alpha, alpha);
	}
	')

	public function new()
	{
		super();
	}
}