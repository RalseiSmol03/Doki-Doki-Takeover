package mobile.flixel;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import mobile.flixel.FlxButton;
import openfl.utils.Assets;

enum FlxDPadMode
{
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	LEFT_FULL;
	RIGHT_FULL;
	NONE;
}

enum FlxActionMode
{
	A;
	B;
	A_B;
	A_B_C;
	A_B_X_Y;
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	A_B_C_D_V_X_Y_Z;
	NONE;
}

/**
 * A gamepad.
 * It's easy to customize the layout.
 *
 * @author Ka Wing Chin
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class FlxVirtualPad extends FlxSpriteGroup
{
	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonA:FlxButton = new FlxButton(0, 0);
	public var buttonB:FlxButton = new FlxButton(0, 0);
	public var buttonC:FlxButton = new FlxButton(0, 0);
	public var buttonD:FlxButton = new FlxButton(0, 0);
	public var buttonE:FlxButton = new FlxButton(0, 0);
	public var buttonV:FlxButton = new FlxButton(0, 0);
	public var buttonX:FlxButton = new FlxButton(0, 0);
	public var buttonY:FlxButton = new FlxButton(0, 0);
	public var buttonZ:FlxButton = new FlxButton(0, 0);

	/**
	 * Create a gamepad.
	 *
	 * @param   DPadMode     The D-Pad mode. `LEFT_FULL` for example.
	 * @param   ActionMode   The action buttons mode. `A_B_C` for example.
	 */
	public function new(DPad:FlxDPadMode, Action:FlxActionMode)
	{
		super();

		switch (DPad)
		{
			case UP_DOWN:
				add(buttonUp = createButton(0, FlxG.height - 255, 'up', FlxColor.fromRGB(193, 255, 126)));
				add(buttonDown = createButton(0, FlxG.height - 135, 'down', FlxColor.fromRGB(143, 239, 254)));
			case LEFT_RIGHT:
				add(buttonLeft = createButton(0, FlxG.height - 135, 'left', FlxColor.fromRGB(185, 150, 250)));
				add(buttonRight = createButton(127, FlxG.height - 135, 'right', FlxColor.fromRGB(255, 170, 238)));
			case UP_LEFT_RIGHT:
				add(buttonUp = createButton(105, FlxG.height - 243, 'up', FlxColor.fromRGB(193, 255, 126)));
				add(buttonLeft = createButton(0, FlxG.height - 135, 'left', FlxColor.fromRGB(185, 150, 250)));
				add(buttonRight = createButton(207, FlxG.height - 135, 'right', FlxColor.fromRGB(255, 170, 238)));
			case LEFT_FULL:
				add(buttonUp = createButton(105, FlxG.height - 345, 'up', FlxColor.fromRGB(193, 255, 126)));
				add(buttonLeft = createButton(0, FlxG.height - 243, 'left', FlxColor.fromRGB(185, 150, 250)));
				add(buttonRight = createButton(207, FlxG.height - 243, 'right', FlxColor.fromRGB(255, 170, 238)));
				add(buttonDown = createButton(105, FlxG.height - 135, 'down', FlxColor.fromRGB(143, 239, 254)));
			case RIGHT_FULL:
				add(buttonUp = createButton(FlxG.width - 258, FlxG.height - 408, 'up', FlxColor.fromRGB(193, 255, 126)));
				add(buttonLeft = createButton(FlxG.width - 384, FlxG.height - 309, 'left', FlxColor.fromRGB(185, 150, 250)));
				add(buttonRight = createButton(FlxG.width - 132, FlxG.height - 309, 'right', FlxColor.fromRGB(255, 170, 238)));
				add(buttonDown = createButton(FlxG.width - 258, FlxG.height - 201, 'down', FlxColor.fromRGB(143, 239, 254)));
			case NONE: // do nothing
		}

		switch (Action)
		{
			case A:
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case B:
				add(buttonB = createButton(FlxG.width - 132, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
			case A_B:
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case A_B_C:
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 'c', FlxColor.fromRGB(254, 230, 244)));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case A_B_X_Y:
				add(buttonX = createButton(FlxG.width - 510, FlxG.height - 135, 'x', FlxColor.fromRGB(254, 230, 244)));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonY = createButton(FlxG.width - 384, FlxG.height - 135, 'y', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case A_B_C_X_Y:
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 'c', FlxColor.fromRGB(254, 230, 244)));
				add(buttonX = createButton(FlxG.width - 258, FlxG.height - 255, 'x', FlxColor.fromRGB(254, 230, 244)));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonY = createButton(FlxG.width - 132, FlxG.height - 255, 'y', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case A_B_C_X_Y_Z:
				add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 'x', FlxColor.fromRGB(254, 230, 244)));
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 'c', FlxColor.fromRGB(254, 230, 244)));
				add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 'y', FlxColor.fromRGB(254, 230, 244)));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 'z', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case A_B_C_D_V_X_Y_Z:
				add(buttonV = createButton(FlxG.width - 510, FlxG.height - 255, 'v', FlxColor.fromRGB(254, 230, 244)));
				add(buttonD = createButton(FlxG.width - 510, FlxG.height - 135, 'd', FlxColor.fromRGB(254, 230, 244)));
				add(buttonX = createButton(FlxG.width - 384, FlxG.height - 255, 'x', FlxColor.fromRGB(254, 230, 244)));
				add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 'c', FlxColor.fromRGB(254, 230, 244)));
				add(buttonY = createButton(FlxG.width - 258, FlxG.height - 255, 'y', FlxColor.fromRGB(254, 230, 244)));
				add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', FlxColor.fromRGB(254, 230, 244)));
				add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 255, 'z', FlxColor.fromRGB(254, 230, 244)));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', FlxColor.fromRGB(254, 230, 244)));
			case NONE: // do nothing
		}

		scrollFactor.set();
	}

	/**
	 * Clean up memory.
	 */
	override public function destroy():Void
	{
		super.destroy();

		buttonLeft = FlxDestroyUtil.destroy(buttonLeft);
		buttonUp = FlxDestroyUtil.destroy(buttonUp);
		buttonDown = FlxDestroyUtil.destroy(buttonDown);
		buttonRight = FlxDestroyUtil.destroy(buttonRight);
		buttonA = FlxDestroyUtil.destroy(buttonA);
		buttonB = FlxDestroyUtil.destroy(buttonB);
		buttonC = FlxDestroyUtil.destroy(buttonC);
		buttonD = FlxDestroyUtil.destroy(buttonD);
		buttonE = FlxDestroyUtil.destroy(buttonE);
		buttonV = FlxDestroyUtil.destroy(buttonV);
		buttonX = FlxDestroyUtil.destroy(buttonX);
		buttonY = FlxDestroyUtil.destroy(buttonY);
		buttonZ = FlxDestroyUtil.destroy(buttonZ);
	}

	private function createButton(X:Float, Y:Float, Graphic:String, Color:Int = 0xFFFFFF):FlxButton
	{
		var graphic:FlxGraphic;

		if (Assets.exists('assets/mobile/virtualpad/${Graphic}.png'))
			graphic = FlxG.bitmap.add('assets/mobile/virtualpad/${Graphic}.png');
		else
			graphic = FlxG.bitmap.add('assets/mobile/virtualpad/default.png');

		var button:FlxButton = new FlxButton(X, Y);
		button.frames = FlxTileFrames.fromGraphic(graphic, FlxPoint.get(Std.int(graphic.width / 3), graphic.height));
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.color = Color;
		button.alpha = 0.5;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}
}
