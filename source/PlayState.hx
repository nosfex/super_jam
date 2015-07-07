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
	private var _clockStage :Int  = 2;
	private var _mainCamera :FlxCamera;
	private var _starPowerBar :FlxSprite;
	private var _healthBar :FlxSprite;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		_player = new Player(20, FlxG.height * 0.8, AssetPaths.left_chainsaw__png);
		
		FlxG.player = _player;
		//add(_player.makeGraphic(10, 10));
		
		_player.velocity.x = 1;// = new FlxPoint(10, 0);
		
		FlxG.log.add(_player);
	
		_scroller = new InfiniteScroller();
		_scroller.addImageData(InfiniteScroller.iscroll_background, [AssetPaths.ul_clouds_0__png, AssetPaths.ul_clouds_0__png]);
		_scroller.addImageData(InfiniteScroller.iscroll_foreground, [AssetPaths.scr_street__png, AssetPaths.scr_street__png]);
		add(_scroller);
		add(_player);
		
		
		_enemyController = new EnemyController();
		add(_enemyController);
		add(_enemyController.particleGroup);
		
		
		// GH: UI TIME
		_jamTime = new FlxText(FlxG.width >> 1, FlxG.height * 0.03, 200, "CULO", 16);
		_jamTime.x -= cast(_jamTime.width, Float) * 0.5;
		_jamTime.scrollFactor.set(0, 0);// = new FlxPoint();
		add(_jamTime);
		
		var hpText :FlxText = new FlxText(FlxG.width * .02, FlxG.height * .01, 200, "HEALTH", 16);
		add(hpText);
		hpText.scrollFactor.set(0, 0);
		
		_healthBar = new FlxSprite(FlxG.width * .02, FlxG.height * 0.05);
		_healthBar = _healthBar.makeGraphic(100, 20, FlxColor.RED);
		add(_healthBar);
		_healthBar.origin.x = 0;
		_healthBar.scrollFactor.set(0, 0);
		_healthBar.scale.x = _player.health / 3;
		
		var spText :FlxText = new FlxText(FlxG.width * .02, FlxG.height * .09, 200, "STARPOWER", 16);
		add(spText);
		spText.scrollFactor.set(0,0);
		_starPowerBar = new FlxSprite(FlxG.width * .02, FlxG.height * 0.135);
		_starPowerBar = _starPowerBar.makeGraphic(100, 20, FlxColor.GOLDEN);
		add(_starPowerBar);
		_starPowerBar.origin.x = 0;
		_starPowerBar.scrollFactor.set(0, 0);
		_starPowerBar.scale.x = _player.starPowerCurrent / _player.starPowerMax;
		
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER, 1);
		
		
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
		
		FlxG.collide(_enemyController, _player, onCollide);
		
		FlxG.collide(_enemyController, _enemyController, onCollide);
		
		_starPowerBar.scale.x = _player.starPowerCurrent / _player.starPowerMax;
		_healthBar.scale.x = _player.health / 3;
		if (FlxG.keys.justPressed.A)
		{
			//_mainCamera.shake(0.05);
			FlxG.log.add("WIDTH " + FlxG.stage.stageWidth );
			
		}
		
		
		_jamTime.text = "JAM TIME: " + _clockStage + ":" + Math.round(_jamTimer);
		if (_jamTimer == 60 && _clockStage == 2)
		{
			_jamTime.text = "JAM TIME: 2:00";
		}
		_jamTimer -= FlxG.elapsed;
		if (_clockStage == 2 && _jamTimer < 60)
			_clockStage = 1;
			
		if (_jamTimer <= 0 )
		{
			_clockStage = 0;
			_jamTimer = 60;
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