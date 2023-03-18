package shaders;

import flixel.system.FlxAssets.FlxShader;
import openfl.display.BitmapData;
import openfl.display.ShaderInput;
import openfl.utils.Assets;
import flixel.FlxG;
import openfl.Lib;

class PixelShader extends FlxShader // https://www.shadertoy.com/view/4l2fDz
{
  public var upFloat:Float = 0.0;
  @:glFragmentSource('
    #pragma header

    uniform float iTime;
    uniform float strength;

    void main()
    {
        vec2 pixel_count = max(floor(openfl_TextureSize.xy * vec2((cos(strength) + 1.0) / 2.0)), 1.0);
        vec2 pixel_size = openfl_TextureSize.xy / pixel_count;
        vec2 pixel = (pixel_size * floor(openfl_TextureCoordv / pixel_size)) + (pixel_size / 1.0);
        vec2 uv = pixel.xy / openfl_TextureSize.xy;
        
        gl_FragColor = vec4(flixel_texture2D(bitmap, uv).xyz, 1.0);
    }
    ')
  public function new()
  {
		data.strength.value = upFloat;//Max is 2.7
    super();
  }
}//haMBURGERCHEESBEUBRGER!!!!!!!!
