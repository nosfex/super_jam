package enemy;

import flash.events.Event;
import flash.geom.Point;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.util.FlxMath;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
/**
 * ...
 * @author Gerardo Heidel
 */
class EnemyController extends FlxGroup
{
	
	public static var v_formation : Int = 0;
	public var particleGroup(default, default) :FlxGroup = new FlxGroup();
	private var _currentChaserCount :Int =  0;
	public function new() 
	{
		super();
	}
	
	private function spawnEnemy(x :Float = -1, y : Float = -1) :Enemy
	{
		var e :Enemy = null;
		if (x == -1 && y == -1)
		{
			y = (FlxG.height * 0.75) + (Math.random() * (FlxG.height - FlxG.height * 0.75));
			x = FlxG.width * 1.1;
			FlxG.log.add("WRONG");
		}
			
		e = new Enemy(x, y, AssetPaths.left_chainsaw_mod__png);
		add(e);
		
		particleGroup.add(e.goreEmitter);
		return e;
	}
		
	public override function update() :Void
	{
		super.update();
		for (i in 0 ... members.length)
		{
			if (members[i] != null)
			{
				var m :Enemy = cast( members[i], Enemy);
				if (!m.alive)
				{
					
					if (m.forceFollow)
					{
						_currentChaserCount--;
						FlxG.log.add("CHASER DEAD");
						m.forceFollow = false;
					}
					remove(members[i], true);
					
					spawnEnemy(FlxG.player.x + (FlxG.width / 3) * 1.2,  FlxG.height * .65 );
				}
				
				if (FlxMath.distanceBetween(m, FlxG.player) < FlxG.width * .35)
				{
					
					if (FlxG.player.x < m.x)
					{
						if (m.forceFollow == false)
						{
							m.forceFollow = true;
							_currentChaserCount++;
						}	
					}
				}	
			
			}
		}	
		
		if (members.length == 0)
		{
			_currentChaserCount = 0;
			spawnFormation(v_formation);
		}	
	}
	
	public function spawnFormation(formation : Int) :Void
	{
		FlxG.log.add("spawning formation");
		switch(formation)
		{
			case v_formation:
				for (i in 0 ... 4)
				{			
					var xMod :Float = Math.max( Math.min((i % 3), 0.05), 0);
					spawnEnemy(FlxG.player.x + (FlxG.width/3) * (1.2 + xMod), FlxG.height * (.65 + i * .08));
				}
			
		}
	}
	
	
	
	
}