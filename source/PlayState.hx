package;

import base.ICollidable;
import bkg.BackgroundScroller;
import enemy.EnemyController;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
	
	private var _scroller :BackgroundScroller;
	private var _player :Player;
	private var _enemyController :EnemyController;
	
	private var _mainCamera :FlxCamera;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_player = new Player(20, FlxG.height * 0.8, AssetPaths.left_chainsaw__png);
		
		FlxG.player = _player;
		//add(_player.makeGraphic(10, 10));
		
		_player.velocity.x = 1;// = new FlxPoint(10, 0);
		_scroller = new BackgroundScroller();
		FlxG.log.add(_player);
		_scroller.initScroller(BackgroundScroller.bscroller_background, [AssetPaths.ul_clouds_0__png, AssetPaths.ul_clouds_0__png]);
		_scroller.initScroller(BackgroundScroller.bscroller_foreground, [AssetPaths.scr_street__png, AssetPaths.scr_street__png]);
		add(_scroller);
		add(_player);
		
		_enemyController = new EnemyController();
		add(_enemyController);
		add(_enemyController.particleGroup);
		_mainCamera = new FlxCamera(-0, 0 , FlxG.width , FlxG.height);
		FlxG.cameras.add(_mainCamera);
		
		FlxG.camera.setBounds(0, 0, FlxG.width * 2, FlxG.height);
		FlxG.camera.follow(_player);
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
		
		if (FlxG.keys.justPressed.A)
		{
			_mainCamera.shake(0.05);
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