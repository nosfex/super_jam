package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		path.set ("assets/images/bkg/scr_bkg.png", "assets/images/bkg/scr_bkg.png");
		type.set ("assets/images/bkg/scr_bkg.png", AssetType.IMAGE);
		path.set ("assets/images/bkg/scr_street.png", "assets/images/bkg/scr_street.png");
		type.set ("assets/images/bkg/scr_street.png", AssetType.IMAGE);
		path.set ("assets/images/bkg/ul_clouds_0.png", "assets/images/bkg/ul_clouds_0.png");
		type.set ("assets/images/bkg/ul_clouds_0.png", AssetType.IMAGE);
		path.set ("assets/images/character/bubble.png", "assets/images/character/bubble.png");
		type.set ("assets/images/character/bubble.png", AssetType.IMAGE);
		path.set ("assets/images/character/enemy_1.png", "assets/images/character/enemy_1.png");
		type.set ("assets/images/character/enemy_1.png", AssetType.IMAGE);
		path.set ("assets/images/character/enemy_2.png", "assets/images/character/enemy_2.png");
		type.set ("assets/images/character/enemy_2.png", AssetType.IMAGE);
		path.set ("assets/images/character/enemy_3.png", "assets/images/character/enemy_3.png");
		type.set ("assets/images/character/enemy_3.png", AssetType.IMAGE);
		path.set ("assets/images/character/jammer.png", "assets/images/character/jammer.png");
		type.set ("assets/images/character/jammer.png", AssetType.IMAGE);
		path.set ("assets/images/character/jammer_death.png", "assets/images/character/jammer_death.png");
		type.set ("assets/images/character/jammer_death.png", AssetType.IMAGE);
		path.set ("assets/images/character/zebra.png", "assets/images/character/zebra.png");
		type.set ("assets/images/character/zebra.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/arrowLeft.png", "assets/images/debugger/buttons/arrowLeft.png");
		type.set ("assets/images/debugger/buttons/arrowLeft.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/arrowRight.png", "assets/images/debugger/buttons/arrowRight.png");
		type.set ("assets/images/debugger/buttons/arrowRight.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/bitmapLog.png", "assets/images/debugger/buttons/bitmapLog.png");
		type.set ("assets/images/debugger/buttons/bitmapLog.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/close.png", "assets/images/debugger/buttons/close.png");
		type.set ("assets/images/debugger/buttons/close.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/console.png", "assets/images/debugger/buttons/console.png");
		type.set ("assets/images/debugger/buttons/console.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/drawDebug.png", "assets/images/debugger/buttons/drawDebug.png");
		type.set ("assets/images/debugger/buttons/drawDebug.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/log.png", "assets/images/debugger/buttons/log.png");
		type.set ("assets/images/debugger/buttons/log.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/maximize.png", "assets/images/debugger/buttons/maximize.png");
		type.set ("assets/images/debugger/buttons/maximize.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/minimize.png", "assets/images/debugger/buttons/minimize.png");
		type.set ("assets/images/debugger/buttons/minimize.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/open.png", "assets/images/debugger/buttons/open.png");
		type.set ("assets/images/debugger/buttons/open.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/pause.png", "assets/images/debugger/buttons/pause.png");
		type.set ("assets/images/debugger/buttons/pause.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/record_off.png", "assets/images/debugger/buttons/record_off.png");
		type.set ("assets/images/debugger/buttons/record_off.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/record_on.png", "assets/images/debugger/buttons/record_on.png");
		type.set ("assets/images/debugger/buttons/record_on.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/restart.png", "assets/images/debugger/buttons/restart.png");
		type.set ("assets/images/debugger/buttons/restart.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/stats.png", "assets/images/debugger/buttons/stats.png");
		type.set ("assets/images/debugger/buttons/stats.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/step.png", "assets/images/debugger/buttons/step.png");
		type.set ("assets/images/debugger/buttons/step.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/stop.png", "assets/images/debugger/buttons/stop.png");
		type.set ("assets/images/debugger/buttons/stop.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/toggleSize.png", "assets/images/debugger/buttons/toggleSize.png");
		type.set ("assets/images/debugger/buttons/toggleSize.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/buttons/watch.png", "assets/images/debugger/buttons/watch.png");
		type.set ("assets/images/debugger/buttons/watch.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/flixel.png", "assets/images/debugger/flixel.png");
		type.set ("assets/images/debugger/flixel.png", AssetType.IMAGE);
		path.set ("assets/images/debugger/windowHandle.png", "assets/images/debugger/windowHandle.png");
		type.set ("assets/images/debugger/windowHandle.png", AssetType.IMAGE);
		path.set ("assets/images/end_screen/facebook_icon.png", "assets/images/end_screen/facebook_icon.png");
		type.set ("assets/images/end_screen/facebook_icon.png", AssetType.IMAGE);
		path.set ("assets/images/end_screen/twitter_icon.png", "assets/images/end_screen/twitter_icon.png");
		type.set ("assets/images/end_screen/twitter_icon.png", AssetType.IMAGE);
		path.set ("assets/images/end_screen/wheels_score.png", "assets/images/end_screen/wheels_score.png");
		type.set ("assets/images/end_screen/wheels_score.png", AssetType.IMAGE);
		path.set ("assets/images/end_screen/youtube_icon.png", "assets/images/end_screen/youtube_icon.png");
		type.set ("assets/images/end_screen/youtube_icon.png", AssetType.IMAGE);
		path.set ("assets/images/help_screen/arrow_down.png", "assets/images/help_screen/arrow_down.png");
		type.set ("assets/images/help_screen/arrow_down.png", AssetType.IMAGE);
		path.set ("assets/images/help_screen/arrow_right.png", "assets/images/help_screen/arrow_right.png");
		type.set ("assets/images/help_screen/arrow_right.png", AssetType.IMAGE);
		path.set ("assets/images/help_screen/arrow_up.png", "assets/images/help_screen/arrow_up.png");
		type.set ("assets/images/help_screen/arrow_up.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/logo/default.png", "assets/images/logo/default.png");
		type.set ("assets/images/logo/default.png", AssetType.IMAGE);
		path.set ("assets/images/logo/HaxeFlixel.svg", "assets/images/logo/HaxeFlixel.svg");
		type.set ("assets/images/logo/HaxeFlixel.svg", AssetType.TEXT);
		path.set ("assets/images/logo/logo.png", "assets/images/logo/logo.png");
		type.set ("assets/images/logo/logo.png", AssetType.IMAGE);
		path.set ("assets/images/particles/p_blood_0.png", "assets/images/particles/p_blood_0.png");
		type.set ("assets/images/particles/p_blood_0.png", AssetType.IMAGE);
		path.set ("assets/images/particles/p_explosion.png", "assets/images/particles/p_explosion.png");
		type.set ("assets/images/particles/p_explosion.png", AssetType.IMAGE);
		path.set ("assets/images/particles/p_gore_0.png", "assets/images/particles/p_gore_0.png");
		type.set ("assets/images/particles/p_gore_0.png", AssetType.IMAGE);
		path.set ("assets/images/preloader/corners.png", "assets/images/preloader/corners.png");
		type.set ("assets/images/preloader/corners.png", AssetType.IMAGE);
		path.set ("assets/images/preloader/light.png", "assets/images/preloader/light.png");
		type.set ("assets/images/preloader/light.png", AssetType.IMAGE);
		path.set ("assets/images/random/left_chainsaw.png", "assets/images/random/left_chainsaw.png");
		type.set ("assets/images/random/left_chainsaw.png", AssetType.IMAGE);
		path.set ("assets/images/random/left_chainsaw_mod.png", "assets/images/random/left_chainsaw_mod.png");
		type.set ("assets/images/random/left_chainsaw_mod.png", AssetType.IMAGE);
		path.set ("assets/images/tile/autotiles.png", "assets/images/tile/autotiles.png");
		type.set ("assets/images/tile/autotiles.png", AssetType.IMAGE);
		path.set ("assets/images/tile/autotiles_alt.png", "assets/images/tile/autotiles_alt.png");
		type.set ("assets/images/tile/autotiles_alt.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/0.png", "assets/images/title_screen/0.png");
		type.set ("assets/images/title_screen/0.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/1.png", "assets/images/title_screen/1.png");
		type.set ("assets/images/title_screen/1.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/2.png", "assets/images/title_screen/2.png");
		type.set ("assets/images/title_screen/2.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/3.png", "assets/images/title_screen/3.png");
		type.set ("assets/images/title_screen/3.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/bkg_title_screen.png", "assets/images/title_screen/bkg_title_screen.png");
		type.set ("assets/images/title_screen/bkg_title_screen.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/flag.png", "assets/images/title_screen/flag.png");
		type.set ("assets/images/title_screen/flag.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/logo_frames.png", "assets/images/title_screen/logo_frames.png");
		type.set ("assets/images/title_screen/logo_frames.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/logo_frames.rar", "assets/images/title_screen/logo_frames.rar");
		type.set ("assets/images/title_screen/logo_frames.rar", AssetType.BINARY);
		path.set ("assets/images/title_screen/title.png", "assets/images/title_screen/title.png");
		type.set ("assets/images/title_screen/title.png", AssetType.IMAGE);
		path.set ("assets/images/title_screen/wheel.png", "assets/images/title_screen/wheel.png");
		type.set ("assets/images/title_screen/wheel.png", AssetType.IMAGE);
		path.set ("assets/images/ui/analog/base.png", "assets/images/ui/analog/base.png");
		type.set ("assets/images/ui/analog/base.png", AssetType.IMAGE);
		path.set ("assets/images/ui/analog/thumb.png", "assets/images/ui/analog/thumb.png");
		type.set ("assets/images/ui/analog/thumb.png", AssetType.IMAGE);
		path.set ("assets/images/ui/button.png", "assets/images/ui/button.png");
		type.set ("assets/images/ui/button.png", AssetType.IMAGE);
		path.set ("assets/images/ui/countdown_1.png", "assets/images/ui/countdown_1.png");
		type.set ("assets/images/ui/countdown_1.png", AssetType.IMAGE);
		path.set ("assets/images/ui/cursor.png", "assets/images/ui/cursor.png");
		type.set ("assets/images/ui/cursor.png", AssetType.IMAGE);
		path.set ("assets/images/ui/fontData11pt.png", "assets/images/ui/fontData11pt.png");
		type.set ("assets/images/ui/fontData11pt.png", AssetType.IMAGE);
		path.set ("assets/images/ui/life_icon.png", "assets/images/ui/life_icon.png");
		type.set ("assets/images/ui/life_icon.png", AssetType.IMAGE);
		path.set ("assets/images/ui/star_icon.png", "assets/images/ui/star_icon.png");
		type.set ("assets/images/ui/star_icon.png", AssetType.IMAGE);
		path.set ("assets/images/ui/time_icon.png", "assets/images/ui/time_icon.png");
		type.set ("assets/images/ui/time_icon.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/a.png", "assets/images/ui/virtualpad/a.png");
		type.set ("assets/images/ui/virtualpad/a.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/b.png", "assets/images/ui/virtualpad/b.png");
		type.set ("assets/images/ui/virtualpad/b.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/c.png", "assets/images/ui/virtualpad/c.png");
		type.set ("assets/images/ui/virtualpad/c.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/down.png", "assets/images/ui/virtualpad/down.png");
		type.set ("assets/images/ui/virtualpad/down.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/left.png", "assets/images/ui/virtualpad/left.png");
		type.set ("assets/images/ui/virtualpad/left.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/right.png", "assets/images/ui/virtualpad/right.png");
		type.set ("assets/images/ui/virtualpad/right.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/up.png", "assets/images/ui/virtualpad/up.png");
		type.set ("assets/images/ui/virtualpad/up.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/x.png", "assets/images/ui/virtualpad/x.png");
		type.set ("assets/images/ui/virtualpad/x.png", AssetType.IMAGE);
		path.set ("assets/images/ui/virtualpad/y.png", "assets/images/ui/virtualpad/y.png");
		type.set ("assets/images/ui/virtualpad/y.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/beep.mp3", "assets/sounds/beep.mp3");
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.mp3", "assets/sounds/flixel.mp3");
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/temp/burbuja.piskel", "assets/temp/burbuja.piskel");
		type.set ("assets/temp/burbuja.piskel", AssetType.TEXT);
		path.set ("assets/temp/charco.png", "assets/temp/charco.png");
		type.set ("assets/temp/charco.png", AssetType.IMAGE);
		path.set ("assets/temp/ej score.jpg", "assets/temp/ej score.jpg");
		type.set ("assets/temp/ej score.jpg", AssetType.IMAGE);
		path.set ("assets/temp/flecha izq.png", "assets/temp/flecha izq.png");
		type.set ("assets/temp/flecha izq.png", AssetType.IMAGE);
		path.set ("assets/temp/FONDO_GAME.jpg", "assets/temp/FONDO_GAME.jpg");
		type.set ("assets/temp/FONDO_GAME.jpg", AssetType.IMAGE);
		path.set ("assets/temp/FONDO_GAME_480x1600.png", "assets/temp/FONDO_GAME_480x1600.png");
		type.set ("assets/temp/FONDO_GAME_480x1600.png", AssetType.IMAGE);
		path.set ("assets/temp/game over.gif", "assets/temp/game over.gif");
		type.set ("assets/temp/game over.gif", AssetType.IMAGE);
		path.set ("assets/temp/game-over.piskel", "assets/temp/game-over.piskel");
		type.set ("assets/temp/game-over.piskel", AssetType.TEXT);
		path.set ("assets/temp/gatorade.png", "assets/temp/gatorade.png");
		type.set ("assets/temp/gatorade.png", AssetType.IMAGE);
		path.set ("assets/temp/hinchada_1.png", "assets/temp/hinchada_1.png");
		type.set ("assets/temp/hinchada_1.png", AssetType.IMAGE);
		path.set ("assets/temp/hinchada_2.png", "assets/temp/hinchada_2.png");
		type.set ("assets/temp/hinchada_2.png", AssetType.IMAGE);
		path.set ("assets/temp/hinchada_3.png", "assets/temp/hinchada_3.png");
		type.set ("assets/temp/hinchada_3.png", AssetType.IMAGE);
		path.set ("assets/temp/jammer_muerte.piskel", "assets/temp/jammer_muerte.piskel");
		type.set ("assets/temp/jammer_muerte.piskel", AssetType.TEXT);
		path.set ("assets/temp/logo.jpg", "assets/temp/logo.jpg");
		type.set ("assets/temp/logo.jpg", AssetType.IMAGE);
		path.set ("assets/temp/logopiratas.gif", "assets/temp/logopiratas.gif");
		type.set ("assets/temp/logopiratas.gif", AssetType.IMAGE);
		path.set ("assets/temp/title_correct.png", "assets/temp/title_correct.png");
		type.set ("assets/temp/title_correct.png", AssetType.IMAGE);
		path.set ("assets/temp/zebra.gif", "assets/temp/zebra.gif");
		type.set ("assets/temp/zebra.gif", AssetType.IMAGE);
		path.set ("assets/temp/zebra.piskel", "assets/temp/zebra.piskel");
		type.set ("assets/temp/zebra.piskel", AssetType.TEXT);
		path.set ("assets/temp/_p_base.png", "assets/temp/_p_base.png");
		type.set ("assets/temp/_p_base.png", AssetType.IMAGE);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);

						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash
















































































































#elseif html5


@:keep class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "assets/fonts/arial.ttf"; } #end }
@:keep class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "assets/fonts/nokiafc22.ttf"; } #end }












































































































#elseif (windows || mac || linux)




#end
