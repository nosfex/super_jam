package ;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

import flash.Lib;
import flash.net.URLRequest;

/**
 * ...
 * @author Gerardo Heidel
 */
class GameOverState extends FlxState
{

	private var _replay :FlxButton;
	private var _fb : FlxButton;
	private var _twitter :FlxButton;
	private var _finalScore:FlxText;
	private var _followText :FlxText;
	
	override public function create() 
	{
		_replay = new FlxButton(FlxG.width * .5,  FlxG.height * .6, "JUGAR", onReplay);
		add(_replay);
		_replay.x -= _replay.width * .5;
		
		_fb = new FlxButton( FlxG.width * .5, FlxG.height * .75, "", onFB );
		add(_fb);
		_fb.loadGraphic(AssetPaths.facebook_icon__png);
		_fb.x -= _fb.width + 50;
		
		_twitter = new FlxButton(FlxG.width * .5 , FlxG.height * .75, "", onTwitter);
		add(_twitter);
		_twitter.loadGraphic(AssetPaths.twitter_icon__png);
		_twitter.x += 50;
		
		_finalScore = new FlxText(FlxG.width * .5, FlxG.height * .4, 300, "TU PUNTAJE FINAL: ", 20);
		_finalScore.x -= _finalScore.width * .45;
		//_finalScore.text += FlxG.score;
		add(_finalScore);
		
		var score :FlxText = new FlxText(FlxG.width * .5, FlxG.height * .5, 75, "", 16);
		score.x -= score.width * .35;
		
		add(score);
		score.text += FlxG.score;
		
		var wheels :FlxSprite = new FlxSprite(0, FlxG.height * -.08, AssetPaths.wheels_score__png);
		add(wheels);
		_followText = new FlxText(FlxG.width * .5 , FlxG.height * .68, 200, "SEGUINOS EN: ", 20);
	//	add(_followText);
		_followText.x -= _followText.width * .5;
	}
	
	public function onTwitter() :Void
	{
		Lib.getURL(new URLRequest("https://twitter.com/SCRRollerDerby"));
	}
	
	public function onFB() :Void
	{
		Lib.getURL(new URLRequest("https://www.facebook.com/SailorCityRollersRD"));
	}
	
	public function onReplay() :Void
	{
		FlxG.switchState(new PlayState());
	}
	
}