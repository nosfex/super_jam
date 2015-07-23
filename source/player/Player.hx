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
	@:isVar public var distance(default, default) :Float = 0;
	
	@:isVar public var starPowerMax(default, default) :Float = 3;
	@:isVar public var starPowerCurrent(default, default)  :Float = 0;
	
	@:isVar public var starPowerEnabled(default, default) :Bool = true;
	@:isVar public var usingStarPower(default, default) :Bool = false;
	
	var bounceFactor:Float = 5;
	
	//private var
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);	
		
		init();
	}
	
	public function init() :Void
	{
		health = 3;
		maxVelocity = new FlxPoint (500, 500);
		//this.makeGraphic(20, 20);
		scale = new FlxPoint(3, 3);		
	}

	override public function update() :Void
	{
		super.update();
		
		usingStarPower = false;
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
			
			if (acceleration.y >= 0)
				acceleration.y = 0;
			acceleration.y += -5;
		}
		
		if (FlxG.keys.pressed.DOWN)
		{
			if (acceleration.y <= 0)
				acceleration.y = 0;
			acceleration.y += 5;
		}
		
		if (FlxG.keys.anyJustReleased(["DOWN", "UP"]))
		{
			acceleration.y = 0;
		}
		
		if (FlxG.keys.justPressed.X)
		{
			if (starPowerCurrent >= 1)
			{
				starPowerCurrent --;
			}
			dash();
		}
		
		if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x += 1.25;
		}
		if (acceleration.x <= -3)
		{
			acceleration.x = -3; 
		}
		
		if (FlxG.keys.pressed.SPACE)
		{
			starPowerCurrent -= FlxG.elapsed * 3;
			if (starPowerCurrent < 0)
			{
				// GH: no more star power!
				FlxG.log.add("SHIET");
				starPowerCurrent = 0;
				starPowerEnabled = false;
				maxVelocity = new FlxPoint(500, 500);
			}
			
			if (starPowerEnabled)
			{
				maxVelocity = new FlxPoint(700, 700);
				// GH: running with the devil
				velocity.x = 600;	
				usingStarPower = true;
			}
			
		}
		else
		{
			maxVelocity = new FlxPoint(500, 500);
		}
		
		if (x <= FlxG.width * 0.03)
		{
			x = FlxG.width * 0.03;
		}
			
		starPowerCurrent += FlxG.elapsed / 10;
		if (starPowerCurrent > starPowerMax)
			starPowerCurrent = starPowerMax;
		distance += velocity.x * FlxG.elapsed;
	}
	
	public function dash() :Void
	{
		x += 20;
	}
	
	public function onCollide(other :FlxObject) :Void
	{
		if (usingStarPower)
		{
			
		}
		else
		{
			this.velocity.x *= 0.75;		
		}
	}
	
}