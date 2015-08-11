package ;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Gerardo Heidel
 */

 import flixel.util.FlxColor;
class Pause extends FlxGroup
{
	var up:FlxSprite;
	var down:FlxSprite;
	var right:FlxSprite;

	public function new() 
	{
		super();
		init();
	}
	
	
	private function init() :Void
	{
		
		var bkg :FlxSprite = new FlxSprite(FlxG.width * .5, FlxG.height * .5);
		bkg.makeGraphic(400, 300, FlxColor.BLACK);
		bkg.x -= bkg.width * .5;
		bkg.y -= bkg.height * .5;
		add(bkg);
		
		up = new FlxSprite(FlxG.width * .3, FlxG.height * .2, AssetPaths.arrow_up__png);
		down = new FlxSprite(FlxG.width * .3, FlxG.height * .3, AssetPaths.arrow_down__png);
		right = new FlxSprite(FlxG.width * .3, FlxG.height * .4, AssetPaths.arrow_right__png);
		
		add(up);
		add(down);
		add(right);
		
		var upText : FlxText = new FlxText(FlxG.width * .4, FlxG.height * .28, 200, "ESQUIVA");
		add(upText);
		
		var rightText :FlxText = new FlxText(FlxG.width * .4, FlxG.height * .43, 200, "ACELERA");
		add(rightText);
		
		var playBtn : FlxButton = new FlxButton(FlxG.width * .5, FlxG.height * .8, "JUGAR", onPlay);
		playBtn.x -= playBtn.width * .5;
		add(playBtn);
		
		
	}
	
	private function onPlay() :Void
	{
		FlxG.uiPause = false;
		visible = false;
	}
	
	
}