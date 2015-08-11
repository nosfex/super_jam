package;

import base.ICollidable;
import bkg.BackgroundScroller;
import bkg.InfiniteScroller;
import enemy.EnemyController;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.FlxCamera;
import flixel.effects.FlxFlicker;
import haxe.ds.ObjectMap;
import haxe.io.BytesBuffer;
import openfl.utils.Object;

import player.Player;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private var _scroller :InfiniteScroller;
	private var _player :Player;
	private var _enemyController :EnemyController;
	private var _jamTime :FlxText;
	private var _jamTimer :Float = 60;
	private var _clockStage :Int  = 1;
	private var _mainCamera :FlxCamera;
	private var _starPowerBar :FlxSprite;
	private var _healthBar :FlxSprite;
	private var _scoreText :FlxText;
	private var _jamOverText :FlxText;
	private var _helmet :FlxSprite;
	private var _pause :Pause;
	private var _effect :FlxSprite;
	var zebra:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		FlxG.pauseEntities = false;
		FlxG.score = 0;
		_player = new Player(20, FlxG.height * 0.65, AssetPaths.jammer__png);
		
		FlxG.player = _player;
		_player.velocity.x = 1;
		
		_scroller = new InfiniteScroller();
		_scroller.addImageData(InfiniteScroller.iscroll_background, [AssetPaths.scr_bkg__png, AssetPaths.scr_bkg__png]);
		_scroller.addImageData(InfiniteScroller.iscroll_foreground, [AssetPaths.scr_street__png, AssetPaths.scr_street__png]);
		add(_scroller);
		
		zebra = new FlxSprite(FlxG.width * .4, FlxG.height * .2, AssetPaths.zebra__png);
		zebra.loadGraphic(AssetPaths.zebra__png, true, 150, 150);
		zebra.animation.add("run", [0, 1], 12, true);
		zebra.animation.play("run");
		add(zebra);
		
		
		add(_player);
		
		
		_enemyController = new EnemyController();
		add(_enemyController);
		add(_enemyController.particleGroup);
		
		
		// GH: UI TIME
		_jamTime = new FlxText(FlxG.width >> 1, FlxG.height * 0.03, 200, "", 16);
		_jamTime.x -= cast(_jamTime.width, Float) * 0.5;
		_jamTime.scrollFactor.set(0, 0);// = new FlxPoint();
		add(_jamTime);
		
		_helmet = new FlxSprite(FlxG.width * .02, FlxG.height * .035, AssetPaths.life_icon__png);
		add(_helmet);
		_helmet.scrollFactor.set(0, 0);
		
		_healthBar = new FlxSprite(FlxG.width * .08, FlxG.height * 0.05);
		_healthBar = _healthBar.makeGraphic(100, 20, FlxColor.RED);
		add(_healthBar);
		_healthBar.origin.x = 0;
		_healthBar.scrollFactor.set(0, 0);
		_healthBar.scale.x = _player.health / 3;
		zebra.scrollFactor.set(1, 1);
		
		var star :FlxSprite = new FlxSprite(FlxG.width * .02, FlxG.height * 0.12, AssetPaths.star_icon__png);
		add(star);
		star.scrollFactor.set(0, 0);
		
		_starPowerBar = new FlxSprite(FlxG.width * .08, FlxG.height * 0.135);
		_starPowerBar = _starPowerBar.makeGraphic(100, 20, FlxColor.GOLDEN);
		add(_starPowerBar);
		_starPowerBar.origin.x = 0;
		_starPowerBar.scrollFactor.set(0, 0);
		_starPowerBar.scale.x = _player.starPowerCurrent / _player.starPowerMax;
		
		_scoreText = new FlxText(FlxG.width * 0.8, FlxG.height * 0.09, 200, 16);
		add(_scoreText);
		_scoreText.scrollFactor.set(0, 0);
		
		_jamOverText = new FlxText(FlxG.width * 0.5, FlxG.height * .5, 42 * 9, 42);
		_jamOverText.x -= _jamOverText.width * .45;
		add(_jamOverText);
		_jamOverText.scrollFactor.set(0, 0);
		_scoreText.scrollFactor.set(0, 0);
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER, 1);
		
		_effect = new FlxSprite(_player.x  , _player.y, AssetPaths.bubble__png);
		_effect.loadGraphic(AssetPaths.bubble__png, true, 32, 32);
		_effect.animation.add("run", [0, 1], 12, true);
		
		add(_effect);
		_effect.animation.play("run");
		_effect.visible = false;
		
		FlxG.playerPos = new FlxPoint(_player.x , _player.y);
		
		_pause = new Pause();
		add(_pause);
		
		_effect.scale.set(4, 4);
		super.create();
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
		
		
		if (_jamTimer > 0)
		{
			FlxG.playerPos = new FlxPoint(_player.x , _player.y);
			FlxG.collide(_enemyController, _player, onCollide);
			
			_starPowerBar.scale.x = _player.starPowerCurrent / _player.starPowerMax;
			_healthBar.scale.x = _player.health / 3;
			if (FlxG.keys.justPressed.A)
			{
				FlxG.log.add("WIDTH " + FlxG.stage.stageWidth );
			}
			_jamTime.text = "JAM TIME: " +  _clockStage + ":" + (_jamTimer < 10 ? "0" : "") + Math.round(_jamTimer);
			if (_jamTimer == 60 && _clockStage == 1)
			{
				_jamTime.text = "JAM TIME: 1:00";
			}
			if(_jamTimer > 0)
			if (_clockStage == 1 && _jamTimer < 60)
				_clockStage = 0;
				
			
			_scoreText.text = "SCORE: " + FlxG.score;
			
			if (FlxG.player.usingStarPower)
			{
				_effect.visible = true;
			}
			else
			{
				_effect.visible = false;
			}
			_effect.setPosition(_player.x, _player.y);
			zebra.setPosition( _player.x + FlxG.width *.2 , FlxG.height * .2);
		}
		else
		{
			FlxG.pauseEntities = true;
		}
		
		if (FlxG.player.health <= 0 && _jamTimer > 0)
		{
			_jamTimer = 0; _clockStage = 0;
			if (FlxG.player.animation.curAnim.name != "die")
			{
				FlxG.player.animation.play("die");
			}
		}
		
		if (_jamTimer <= 0 )
		{
			if (_clockStage <= 0)
			{
				_jamOverText.text = "JAM OVER";
				FlxFlicker.flicker(_jamOverText, 3);
			}
		}
		
		if (!FlxG.uiPause)
		{
			_jamTimer -= FlxG.elapsed;
		}
		
		if ( _jamTimer <= -3 )
		{
			// GH: Endgame
			FlxG.switchState(new GameOverState());
		}
		
	}	
	
	private function onCollide(obj1 :FlxObject, obj2 :FlxObject) :Void
	{
		FlxG.log.add("COLLIDING?");
		var o1 : Object =  obj1;
		o1.onCollide(obj2);
		var o2 : Object = obj2;
		o2.onCollide(obj1);
	}
}