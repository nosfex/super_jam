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

	@:isVar public var goreEmitter(default, default):FlxEmitter;
	private var _goreParticle :FlxParticle;
	private var _xMod :Float;
	@:isVar public var forceFollow(default, default) :Bool = false;
	
	private var _enableDeathFlicker :Bool 	= false;
	private var _flickerTimer :Float 		= 0;
	private var _flickerTimerMax :Float 	= 2;
	private var _angleCount : Float 		= 0;
	private var _angleMoveMaxTimer : Float 	= 0;
	private var _angleMoveTimer :Float 		= 0;
	var _bounceFactor : Float 				= 5;
	var _enemyPoint:FlxPoint 				= new FlxPoint();
	var _accelFactor:Float 					= 1.45;
	var _followVelocity : FlxPoint 			= new FlxPoint(750, 750);
	var _keepUpVelocity : FlxPoint 			= new FlxPoint(850, 850);
	var floorHeight :Float 					= FlxG.height * 0.73;
	var ceilHeight : Float 					=  FlxG.height * 0.38;
	var forcePush :Float 					= 0;
	
	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);		
		loadGraphic(SimpleGraphic, true, cast(width / 2), cast(height), false);
		animation.add("run", [0, 1], 5, true);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		
		scale = new FlxPoint(3, 3);
		maxVelocity = _followVelocity;
		
		_xMod = Math.random() * 100 + 50;
		
		goreEmitter = new FlxEmitter();
		goreEmitter.makeParticles(AssetPaths.p_gore_0__png, 15, 16, true);
		
		_angleMoveMaxTimer = Math.random() * 43;
		health = 3;
		animation.play("run");
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
			FlxG.score += 400;
			goreEmitter.start(true, 0);
			FlxFlicker.flicker(this, _flickerTimerMax);
		}
		
		if (other == FlxG.player)
		{
//			if (other.acceleration.x >= 100 && FlxFlicker.isFlickering(this) == false)
			{
				if (FlxG.player.usingStarPower)
				{
					if (acceleration.x > 0 )
					{
						forcePush -= _bounceFactor * 25;
					}
					else
					{
						forcePush += _bounceFactor * 25;
					}
					health--;
					FlxFlicker.flicker(this, 0.3);
				}	
				
			
			}
			
			FlxG.player.drainLife();
			
		
		}
		else
		{
		//	this.x += _bounceFactor;
		}

	}
	
	public override function update() :Void
	{
		if (FlxG.uiPause) return;
		if (FlxG.pauseEntities) return;
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
			
			var xFollow : Float = (FlxG.playerPos.x - x ) * _accelFactor;
			var yFollow : Float = (FlxG.playerPos.y - y) * _accelFactor;
			
			xFollow = FlxG.invertMinMax(FlxG.player.x, x, xFollow);
			yFollow = FlxG.invertMinMax(FlxG.player.y, y, yFollow);
			
			acceleration = new FlxPoint(xFollow, yFollow);
			
			maxVelocity = _followVelocity;
		}
		
		_enemyPoint = new FlxPoint(x, y);
		
		if (/*enemyPoint.distanceTo(FlxG.playerPos) > FlxG.width * 0.4 && */FlxG.player.x > x)
		{
			FlxG.log.add("KEEP UP");
			maxVelocity = _keepUpVelocity;
			forceFollow = false;
			
			if (Math.abs(FlxG.player.x - x ) > 10)
			{
				FlxG.score++;
			}
		}
		
		if (forcePush != 0)
		{
			this.x += forcePush;
			forcePush -= forcePush * .9;
		}
		
		if (acceleration.x < 0)
			facing = FlxObject.LEFT;
		else
			facing = FlxObject.RIGHT;
		this.y = FlxG.checkBounds(floorHeight, ceilHeight, this.y);
	}
	
}