package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	private var _playBtn : FlxButton ;
	
	private var _bkg : FlxSprite;
	private var _flag :FlxSprite;
	private var _logo :FlxSprite;
	private var _title :FlxSprite;
	private var _logoCounter :Float = 0;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_bkg = new FlxSprite(0, 0, AssetPaths.bkg_title_screen__png);
		add(_bkg);
		
		_flag = new FlxSprite(0, 0, AssetPaths.flag__png);
		add(_flag);
		
		_logo = new FlxSprite(FlxG.width * 0.5, FlxG.height * .5, AssetPaths.logo_frames__png);
		
		_logo.loadGraphic(AssetPaths.logo_frames__png, true, 411, 365, true);
		_logo.setPosition(FlxG.width * 0.5 - _logo.frameWidth * .5, FlxG.height * .5 - _logo.frameHeight * .5);
		_logo.animation.add("play", [0, 1, 2, 3], 6, true);
		_logo.animation.play("play");
		add(_logo);
		
		
		
		_title = new FlxSprite(FlxG.width  *0.5, FlxG.height * 0.1, AssetPaths.title_correct__png);
		_title.x -= _title.width * 0.5;
		add(_title);
		
		_playBtn = new FlxButton(FlxG.width * 0.5, FlxG.height * 0.8, onPlay);
		_playBtn.x -= _playBtn.width * 0.5;
		_playBtn.text = "JUGAR";
		add(_playBtn);
		
		
		_title.visible 		= false;
		_playBtn.visible 	= false;
	}
	
	/**
	 * 
	 * playBtn callback
	 */
	
	private function onPlay() : Void
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
		
		if (_logoCounter >= 3)
		{
			_logo.visible 		= false;
			_flag.visible		= false;
			_title.visible 		= true;
			_playBtn.visible 	= true;
		}
		
		_logoCounter += FlxG.elapsed;
	}	
}