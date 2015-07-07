package bkg;

import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxG;
/**
 * ...
 * @author Gerardo Heidel
 */
class InfiniteScroller extends FlxGroup
{
	public static var iscroll_background :Int = 0;
	public static var iscroll_foreground :Int = 1;
	public static var iscroll_underground :Int = 2;

	private var _background :FlxGroup = new FlxGroup();
	private var _foreground :FlxGroup = new FlxGroup();
	
	private var _bkgData :Map<Int, Array<String>> = new Map<Int, Array<String>>();
	@:isVar public var underground(default, default) :FlxGroup = new FlxGroup();
	
	private var _iteration : Float = 0;
	
	
	public function new() 
	{
		super();
		init();
	}
	
	private function init() :Void
	{
		add(_background);
		add(_foreground);
	}
	
	public function addImageData(layerType :Int, assets :Array<String>) :Void
	{
 		_bkgData.set(layerType, assets);
//		refreshLayers(layerType);
	}
	
	public override function update() :Void
	{
		super.update();
		if (FlxG.player.x >= FlxG.width * _iteration)
		{
			_iteration ++;
			FlxG.log.add("DISTANCEEE");
			
			for (i in 0 ... 2) refreshLayers(i);
			FlxG.camera.follow(FlxG.player, FlxCamera.STYLE_PLATFORMER, 1);
		}
		
		for (i in 0 ... 2) checkAlive(i);
		
		
	}
	
	private function checkAlive(layerType :Int) : Void
	{
		var g :FlxGroup = getLayer(layerType);
		if (g.members.length != 0)
		{
			for (i in 0 ... g.members.length)
			{
				var m :FlxSprite = cast(g.members[i], FlxSprite);
				if (m.x < FlxG.camera.x )
				{
					g.members[i].kill();
					g.remove(g.members[i]);
				}
			}
		}
	}
	
	private function getLayer(layerType :Int) :FlxGroup
	{
		switch(layerType)
		{
			case 0:				return _background;
			case 1:				return _foreground;
			case 2:				return underground;
				
		}
		return null;
	}
	
	public function refreshLayers(layerType : Int) :Void
	{
	
		
		var startX :Int = 0;
		if (getLayer(layerType).members.length != 0)
		{
			startX = cast(getLayer(layerType).members[getLayer(layerType).members.length - 1]).x + FlxG.width ;
		}
		if(layerType != 0)
			FlxG.log.add(startX);
		for (i in 0 ... _bkgData[layerType].length)
		{
			var sprite :FlxSprite = i <= 0 ? new FlxSprite(startX, 0, _bkgData[layerType][i]) : new FlxSprite(startX + (i * cast(getLayer(layerType).members[i - 1]).width), 0, _bkgData[layerType][i]);
			getLayer(layerType).add(sprite);
			
		}
		
		//FlxG.worldBounds.setSize(startX, FlxG.height);
		FlxG.camera.setBounds(0, 0, startX + FlxG.width * 2, FlxG.height, true);
	}
	
}