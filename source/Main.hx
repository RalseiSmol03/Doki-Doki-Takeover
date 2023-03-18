package;

import flixel.graphics.FlxGraphic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;
import lime.app.Application;

#if FEATURE_DISCORD
import Discord.DiscordClient;
#end

using StringTools;

class Main extends Sprite
{
	var game:FlxGame;
	var gameWidth:Int = 1280; // Width of the game in pixels
	var gameHeight:Int = 720; // Height of the game in pixels
	var initialState:Class<FlxState> = Init; // The FlxState the game starts with.
	var zoom:Float = 1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets

	public static var fpsVar:FPS;
	public static var tongue:FireTongueEx;

	// You can pretty much ignore everything from here on - your code should go in your states.

	public function new():Void
	{
		super();

		#if CRASH_HANDLER
		SUtil.uncaughtErrorHandler();
		#end

		// Run this first so we can see logs.
		Debug.onInitProgram();

		#if linux
		startFullscreen = isSteamDeck();
		#end

		SUtil.checkFiles();

		game = new FlxGame(gameWidth, gameHeight, initialState, #if (flixel < "5.0.0") zoom, #end framerate, framerate, skipSplash, startFullscreen);
		addChild(game);

		fpsVar = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsVar);

		if (fpsVar != null)
			fpsVar.visible = SaveData.showFPS;

		// Finish up loading debug tools.
		// NOTE: Causes Hashlink to crash, so it's disabled.
		#if !hl
		Debug.onGameStart();
		#end
	}

	inline public static function isSteamDeck():Bool
	{
		#if linux
		return Sys.environment()["USER"] == "deck";
		#else
		return false;
		#end
	}

	inline public static function alertPopup(desc:String, title:String = 'Error!')
	{
		Application.current.window.alert(desc, title);
	}
}
