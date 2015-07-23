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
	var _bounceFactor : Float = 5;
	var _enemyPoint:FlxPoint = new FlxPoint();
	var _accelFactor:Float = 0.75;

	var _followVelocity : FlxPoint = new FlxPoint(650, 650);
	var _keepUpVelocity : FlxPoint = new FlxPoint(750, 750);
	var floorHeight :Float = 0.9;
	var ceilHeight : Float = 0.65;
	
	@:isVar public var forceFollow(default, default) :Bool = false;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);			
		scale = new FlxPoint(3, 3);
		maxVelocity = _followVelocity;
		
		
		_xMod = Math.random() * 100 + 50;
		
		goreEmitter = new FlxEmitter();
		
		goreEmitter.makeParticles(AssetPaths.p_gore_0__png, 15, 16, true);
		
		_angleMoveMaxTimer = Math.random() * 43;
		health = 3;
	}
	
	public function get_goreEmitter() :FlxEmitter { return goreEmitter;  } 
	
	
	public function onCollide(other :FlxObject) :Void
	{
		if (health <= 0 && _enableDeathFlicker == false)
		{
			solid = false;
			_enableDeathFlicker = true;
			acceleration.x = 20;
			goreEmitter.at(this);
			goreEmitter.gravity = 100;
			
			goreEmitter.start(true, 0);
			FlxFlicker.flicker(this, _flickerTimerMax);
		}
		
		
		if (other == FlxG.player)
		{
			if (other.acceleration.x >= 100 && FlxFlicker.isFlickering(this) == false)
			{
				if (FlxG.player.usingStarPower)
				{
					health--;
					FlxFlicker.flicker(this, 0.3);
				}	
			}
			
			if (acceleration.x > 0 )
			{
				this.x -= _bounceFactor;
			}
			else
			{
				this.x += _bounceFactor;
			}
		}
		else
		{
			this.x += _bounceFactor;
		}

	}
	
	public override function update() :Void
	{
		super.update();
		var pos :FlxPoint = new FlxPoint(FlxG.player.x, FlxG.player.y);
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
		acceleration.x = _xMod;
		y += (Math.sin(_angleCount / Math.PI / 180) * _angleMoveMaxTimer) * FlxG.elapsed;
		
		_angleCount += 15;
			
		if (x < FlxG.player.x - FlxG.width)
		{
			FlxG.log.add("KILL ME @X: " + x);
			kill();
		}
		
		if (FlxG.player.x  < x - FlxG.width * 0.5)
		{
			// GH: Slow me down baby
			FlxG.log.add("SLOW ME DOWN");
			acceleration.x = 0.5;
		}
		
		if (forceFollow)
		{
			FlxG.log.add("Force Follow");
			this.x = (FlxG.playerPos.x - x ) * _accelFactor;
			this.y = (FlxG.playerPos.y - y) * _accelFactor;
			maxVelocity = _followVelocity;
		}
		
		_enemyPoint.x = x; _enemyPoint.y = y;
		
		if (/*enemyPoint.distanceTo(FlxG.playerPos) > FlxG.width * 0.4 && */FlxG.player.x > x)
		{
			FlxG.log.add("KEEP UP");
			maxVelocity = _keepUpVelocity;
			forceFollow = false;
		}
		
		if (this.y  >= FlxG.height *floorHeight)
		{        
			this.y = FlxG.height * floorHeight;
		}        
		if (this.y <= FlxG.height * ceilHeight)
		{        
			this.y = FlxG.height * ceilHeight;
		}
		
	}
	
}