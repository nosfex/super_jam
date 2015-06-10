package enemy;

import flash.events.Event;
import flixel.group.FlxGroup;
import flixel.FlxG;
/**
 * ...
 * @author Gerardo Heidel
 */
class EnemyController extends FlxGroup
{
	
	public static var v_formation : Int = 0;
	public var particleGroup(default, default) :FlxGroup = new FlxGroup();
	public function new() 
	{
		super();
	}
	
	private function spawnEnemy(x :Float = -1, y : Float = -1) :Enemy
	{
		var e :Enemy = null;
		if (x == -1 && y == -1)
		{
			x = (FlxG.height * 0.75) + (Math.random() * (FlxG.height - FlxG.height * 0.75));
			y = FlxG.width * 1.1;
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
	//	FlxG.log.add("EC loop");
		for (i in 0 ... members.length)
		{
			if (members[i] != null)
			{
				if (!members[i].alive)
				{
					remove(members[i], true);
				}
			}
		}	
		
		if (members.length == 0)
		{
			spawnFormation(v_formation);
		}
		
	}
	
	public function spawnFormation(formation : Int) :Void
	{
		switch(formation)
		{
			case v_formation:
				for (i in 0 ... 4)
				{
					
					var xMod :Float = Math.max( Math.min((i % 3), 0.05), 0);
					FlxG.log.add("XMOD: " + xMod);
					spawnEnemy(FlxG.width * (1.2 + xMod), FlxG.height * (.65 + i * .08));
				}
			//	break;
		}
	}
	
	
	
	
}