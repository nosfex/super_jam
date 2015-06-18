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
	private var _angleCount : Float = 0;
	private var _angleMoveMaxTimer : Float = 0;
	private var _angleMoveTimer :Float = 0;
	private var _xMod :Float;
	
	
	@:isVar public var forceFollow(default, default) :Bool = false;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);			
		scale = new FlxPoint(3, 3);
		maxVelocity = new FlxPoint(350, 350);
		
		
		_xMod = Math.random() * -100 -50;
		
		goreEmitter = new FlxEmitter();
		
		goreEmitter.makeParticles(AssetPaths.p_gore_0__png, 15, 16, true);
		
		_angleMoveMaxTimer = Math.random() * 43;
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
		acceleration.x = _xMod - FlxG.player.acceleration.x;
		y += (Math.sin(_angleCount / Math.PI / 180) * _angleMoveMaxTimer) * FlxG.elapsed;
		
		_angleCount += 15;
			
	
		if (x < -width * .25)
		{
			kill();
		}
		
		if (forceFollow)
		{
			FlxG.log.add("FOLLOWING");
			var pos :FlxPoint = new FlxPoint(FlxG.player.x, FlxG.player.y);
			acceleration.x = -150 + (pos.x - x );
			acceleration.y = (pos.y - y)*2;
			maxVelocity = new FlxPoint(450, 450);
		}
		
		if (this.y  >= FlxG.height)
		{        
			this.y = FlxG.height;
		}        
		if (this.y <= FlxG.height * 0.65)
		{        
			this.y = FlxG.height * 0.65;
		}
		
	}
	
}