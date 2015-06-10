package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class IntroState extends FlxState
{
	
	private var playBtn : FlxButton;
	private var introText :FlxText;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		playBtn = new FlxButton(FlxG.width * 0.5, FlxG.height * .8, "PLAY", onPlayButton);
		playBtn.x -= playBtn.width * 0.5;
		add(playBtn);
		
		introText = new FlxText(FlxG.width * 0.5, FlxG.height * .6, 550, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 10);
		introText.x -= introText.width * 0.5;
		add(introText);
	}
	
	
	private function onPlayButton() :Void
	{
		FlxG.switchState(new PlayState());
	}
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}