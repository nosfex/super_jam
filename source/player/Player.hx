package player;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.FlxObject;
import base.ICollidable;
/**
 * ...
 * @author Gerardo Heidel
 */
class Player extends FlxSprite implements ICollidable
{
	private var _distance :Float;
	
	private var _starPowerMaxTimer :Float = 3;
	private var _starPowerCurrent  :Float = 0;
	private var _starPowerEnabled :Bool = true;
	//private var
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);	
		
		init();
	}
	
	public function init() :Void
	{
		health = 3;
		maxVelocity = new FlxPoint (250, 250);
		//this.makeGraphic(20, 20);
		scale = new FlxPoint(3, 3);		
	}

	override public function update() :Void
	{
		super.update();
		
		if (this.y  >= FlxG.height)
		{        
			this.y = FlxG.height;
		}        
		if (this.y <= FlxG.height * 0.65)
		{        
			this.y = FlxG.height * 0.65;
		}
		
		if (FlxG.keys.pressed.UP)
		{
			acceleration.y = -50;
		}
		
		if (FlxG.keys.pressed.DOWN)
		{
			acceleration.y = 50;
		}
		
		if (FlxG.keys.anyJustReleased(["DOWN", "UP"]))
		{
			acceleration.y = 0;
		}
		
		if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x += 1.25;
		}
		else
		{
			acceleration.x -= 2.5125;
			if (acceleration.x <= -3)
			{
				acceleration.x = -3; 
			}
		}
		
		if (FlxG.keys.pressed.SPACE)
		{
			_starPowerCurrent += FlxG.elapsed;
			if (_starPowerCurrent >=  _starPowerMaxTimer)
			{
				// GH: no more star power!
				FlxG.log.add("SHIET");
				_starPowerCurrent = 0;
				_starPowerEnabled = false;
				maxVelocity = new FlxPoint(250, 250);
			}
			
			if (_starPowerEnabled)
			{
				maxVelocity = new FlxPoint(600, 250);
				// GH: running with the devil
				velocity.x = 600;
				
			}
		}
		else
		{
			maxVelocity = new FlxPoint(250, 250);
		}
		
		if (x <= FlxG.width * 0.03)
		{
			x = FlxG.width * 0.03;
		}
		
		if (x >= FlxG.width * 0.5)
		{
			x = FlxG.width * 0.5;
		}
		
		_distance += velocity.x * FlxG.elapsed;
	}
	
	
	
	public function onCollide(other :FlxObject) :Void
	{
		if (_starPowerEnabled)
		{
		//	other.kill();
		}
	}
	
}