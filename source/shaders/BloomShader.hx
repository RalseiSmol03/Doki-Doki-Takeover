package shaders;

import flixel.system.FlxAssets.FlxShader;

class BloomShader extends FlxShader // Taken from BBPanzu anime mod hueh
{
	@:glFragmentSource('
	#pragma header
    uniform float funrange;
    uniform float funsteps;
    uniform float funthreshhold;
    uniform float funbrightness;

	uniform float iTime;

	void main() {
    vec2 uv =  openfl_TextureCoordv.xy;
    gl_FragColor = flixel_texture2D(bitmap, uv);

    for (float i = -funrange; i < funrange; i += funsteps) {

        float falloff = 1.0 - abs(i / funrange);

        vec4 blur = flixel_texture2D(bitmap, uv + i);
        if (blur.r + blur.g + blur.b > funthreshhold * 3.0) {
            gl_FragColor += blur * falloff * funsteps * funbrightness;
        }

        blur = flixel_texture2D(bitmap, uv + vec2(i, -i));
        if (blur.r + blur.g + blur.b > funthreshhold * 3.0) {
            gl_FragColor += blur * falloff * funsteps * funbrightness;
        }
    }
	')

	public function new(range:Float = 0.1, steps:Float = 0.005, threshhold:Float = 0.8, brightness:Float = 7.0)
	{
		super();

		data.funrange.value = [range];
		data.funsteps.value = [steps];
		data.funthreshhold.value = [threshhold];
		data.funbrightness.value = [brightness];
	}
}
