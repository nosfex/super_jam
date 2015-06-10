package enemy;

import base.ICollidable;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.effects.FlxFlicker;
/**
 * ...
 * @author Gerardo Heidel
 */
class Enemy extends FlxSprite implements ICollidable
{

	private var _enableDeathFlicker :Bool = false;
	private var _flickerTimer :Float = 0;
	private var _flickerTimerMax :Float = 2;
	@:isVar public var goreEmitter(default, default):FlxEmitter;
	private var _goreParticle :FlxParticle;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);			
		scale = new FlxPoint(3, 3);
		maxVelocity = new FlxPoint(150, 150);
		acceleration.x = -50;
		
		
		goreEmitter = new FlxEmitter();
		
		goreEmitter.makeParticles(AssetPaths.p_gore_0__png, 15, 16, true);
	
		/*for (i in 0 ... 20)
		{
			_goreParticle = new FlxParticle();
			_goreParticle.loadGraphic(
		}*/
		
	}
	
	public function get_goreEmitter() :FlxEmitter { return goreEmitter;  } 
	
	
	public function onCollide(other :FlxObject) :Void
	{
		
		solid = false;
		_enableDeathFlicker = true;
		acceleration.x = 20;
		goreEmitter.at(this);
		goreEmitter.gravity = 100;
		
		goreEmitter.start(true, 0);
		FlxFlicker.flicker(this, _flickerTimerMax);
	}
	
	public override function update() :Void
	{
		super.update();
		if (_enableDeathFlicker)
		{
			_flickerTimer += FlxG.elapsed;
			if (_flickerTimer > _flickerTimerMax)
			{
				_flickerTimer = 0;
				kill();
				_enableDeathFlicker = false;
			}
		
		}
		
	}
	
}