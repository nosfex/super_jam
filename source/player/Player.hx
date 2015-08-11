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
		loadGraphic(SimpleGraphic,  true, 50, 50);
		animation.add("run", [0, 1, 2, 3, 4, 5], 12, true);
		animation.add("run_faster", [0, 1, 2, 3, 4], 30, true);
		animation.add("die", [6, 7, 8, 9], 24, false);
		init();
	}
	
	public function init() :Void
	{
		health = 3;
		maxVelocity = new FlxPoint (500, 500);
		//this.makeGraphic(20, 20);
		scale = new FlxPoint(3, 3);		
		animation.play("run");
	}

	override public function update() :Void
	{
		if (FlxG.uiPause) return;
		
		super.update();
		if (FlxG.pauseEntities) 
		{
			velocity.set(0, 0);
			acceleration.set(0, 0);
			return;
		}
		usingStarPower = false;
		this.y = FlxG.checkBounds(FlxG.height * 0.73, FlxG.height * 0.38, this.y);
		
		if (FlxG.keys.pressed.UP)
		{
			
			if (acceleration.y >= 0)
				acceleration.y *= -1;
			acceleration.y += -15;
		}
		
		if (FlxG.keys.pressed.DOWN)
		{
			if (acceleration.y <= 0)
				acceleration.y *= -1;
			acceleration.y += 15;
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
			//dash();
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
			else
			{
				starPowerEnabled = true;
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
		
		if (velocity.x > maxVelocity.x)
		{
			if(animation.name == "run")
				animation.play("run_faster");
		}
		else
		{	
			if(animation.name == "run_faster")
				animation.play("run");
		}
		
		
		
		starPowerCurrent += FlxG.elapsed / 10;
		if (starPowerCurrent > starPowerMax)
			starPowerCurrent = starPowerMax;
		distance += velocity.x * FlxG.elapsed;
	}
	
	public function drainLife() :Void
	{
		if (usingStarPower)
			return;
			
		health -= .01;
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