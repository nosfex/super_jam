package bkg;

import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
/**
 * ...
 * @author Gerardo Heidel
 */
class BackgroundScroller extends FlxGroup
{
	
	public static var bscroller_foreground : Int = 0;
	public static var bscroller_background : Int = 1;
	public static var bscroller_underlayer : Int = 2;
	

	private var _currentX :Float;
	
	private var _foregroundContainer :Array<FlxSprite> = null;
	private var _backgroundContainer :Array<FlxSprite> = null;
	private var _underlayerContainer :Array<FlxSprite>	= null;
	
	
	private var _fgScrollX :Float	= 0;
	private var _bgScrollX :Float 	= 0;
	private var _ulScrollX :Float  = 0;
	private var _fgIncrementalX :Float = 0;
	private var _bgIncrementalX :Float = 0;
	private var _ulIncrementalX :Float = 0;
			
	public function new(MaxSize:Int=0)
	{
		
		super(MaxSize);
	//	super(X, Y, SimpleGraphic);
	
		_foregroundContainer = new Array();
		_backgroundContainer = new Array();
		_underlayerContainer = new Array();
		
		
				
		_currentX = 0;
	}
	
	
	public function initScroller(scrollerType :Int, assets :Array<String>) :Void
	{
	
		var temp : Array<FlxSprite> = new Array();
		for (i in 0 ... assets.length)
		{

			var sprite :FlxSprite = i <= 0 ? new FlxSprite(i, 0, assets[i]) : new FlxSprite(i * temp[i - 1].width, 0, assets[i]);
			temp.push(sprite);
			add(sprite);
		//	sprite.scrollFactor.set(0, 0);
		}
		
		if (bscroller_foreground == scrollerType)
		{
			_foregroundContainer = temp;
			_fgScrollX = 0;
			_fgIncrementalX = _foregroundContainer[0].width;
		}	
		
		if ( bscroller_background == scrollerType)
		{
			_backgroundContainer = temp;
			_bgIncrementalX = _backgroundContainer[0].width;
		}
			
		if (bscroller_underlayer == scrollerType)
		{
			_underlayerContainer = temp;
			_ulIncrementalX = _underlayerContainer[0].width;
		}
	}
		


	override public function update() :Void
	{
		return;
		
		var speedX :Float = FlxG.player.velocity.x < 0 ? 0 : FlxG.player.velocity.x ;
		if(_foregroundContainer.length != 0)
		{
			
			for(i in 0 ... _foregroundContainer.length)
			{
				_foregroundContainer[i].x = _fgScrollX + i * _fgIncrementalX;
			}
			
			_fgScrollX -= speedX / 50;
			
			if(_fgScrollX < -((_foregroundContainer.length - 1)  *_fgIncrementalX))
			{
				_fgScrollX = 0;
				
			}
		}
		
		
		if(_underlayerContainer.length != 0)
		{
			for(i in 0 ... _underlayerContainer.length)
			{
				_underlayerContainer[i].x = _ulScrollX + i * _ulIncrementalX;
			}
		
			_ulScrollX -= speedX / 1000;	
	
		
			if(_ulScrollX < -((_underlayerContainer.length - 1)  *_ulIncrementalX))
			{
				_ulScrollX = 0;
			}
		}
					
		if(_backgroundContainer.length != 0 )
		{
			for(i in 0 ... _backgroundContainer.length)
			{
				_backgroundContainer[i].x = _bgScrollX + i * _bgIncrementalX;
			}
		
			_bgScrollX -= speedX / 120;
		
			if(_bgScrollX < -((_backgroundContainer.length - 1)  *_bgIncrementalX))
			{
				_bgScrollX = 0;
			}
		}
		
		super.update();
		
	}

	
}
