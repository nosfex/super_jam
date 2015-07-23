package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/bkg/bg_mountain_0.png", "assets/images/bkg/bg_mountain_0.png");
			type.set ("assets/images/bkg/bg_mountain_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bkg/fg_sand_0.png", "assets/images/bkg/fg_sand_0.png");
			type.set ("assets/images/bkg/fg_sand_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bkg/scr_street.jpg", "assets/images/bkg/scr_street.jpg");
			type.set ("assets/images/bkg/scr_street.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bkg/scr_street.png", "assets/images/bkg/scr_street.png");
			type.set ("assets/images/bkg/scr_street.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bkg/ul_clouds_0.png", "assets/images/bkg/ul_clouds_0.png");
			type.set ("assets/images/bkg/ul_clouds_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/arrowLeft.png", "assets/images/debugger/buttons/arrowLeft.png");
			type.set ("assets/images/debugger/buttons/arrowLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/arrowRight.png", "assets/images/debugger/buttons/arrowRight.png");
			type.set ("assets/images/debugger/buttons/arrowRight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/bitmapLog.png", "assets/images/debugger/buttons/bitmapLog.png");
			type.set ("assets/images/debugger/buttons/bitmapLog.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/close.png", "assets/images/debugger/buttons/close.png");
			type.set ("assets/images/debugger/buttons/close.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/console.png", "assets/images/debugger/buttons/console.png");
			type.set ("assets/images/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/drawDebug.png", "assets/images/debugger/buttons/drawDebug.png");
			type.set ("assets/images/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/log.png", "assets/images/debugger/buttons/log.png");
			type.set ("assets/images/debugger/buttons/log.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/maximize.png", "assets/images/debugger/buttons/maximize.png");
			type.set ("assets/images/debugger/buttons/maximize.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/minimize.png", "assets/images/debugger/buttons/minimize.png");
			type.set ("assets/images/debugger/buttons/minimize.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/open.png", "assets/images/debugger/buttons/open.png");
			type.set ("assets/images/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/pause.png", "assets/images/debugger/buttons/pause.png");
			type.set ("assets/images/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/record_off.png", "assets/images/debugger/buttons/record_off.png");
			type.set ("assets/images/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/record_on.png", "assets/images/debugger/buttons/record_on.png");
			type.set ("assets/images/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/restart.png", "assets/images/debugger/buttons/restart.png");
			type.set ("assets/images/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/stats.png", "assets/images/debugger/buttons/stats.png");
			type.set ("assets/images/debugger/buttons/stats.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/step.png", "assets/images/debugger/buttons/step.png");
			type.set ("assets/images/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/stop.png", "assets/images/debugger/buttons/stop.png");
			type.set ("assets/images/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/toggleSize.png", "assets/images/debugger/buttons/toggleSize.png");
			type.set ("assets/images/debugger/buttons/toggleSize.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/buttons/watch.png", "assets/images/debugger/buttons/watch.png");
			type.set ("assets/images/debugger/buttons/watch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/flixel.png", "assets/images/debugger/flixel.png");
			type.set ("assets/images/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/debugger/windowHandle.png", "assets/images/debugger/windowHandle.png");
			type.set ("assets/images/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/logo/default.png", "assets/images/logo/default.png");
			type.set ("assets/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/logo/HaxeFlixel.svg", "assets/images/logo/HaxeFlixel.svg");
			type.set ("assets/images/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/logo/logo.png", "assets/images/logo/logo.png");
			type.set ("assets/images/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/particles/p_blood_0.png", "assets/images/particles/p_blood_0.png");
			type.set ("assets/images/particles/p_blood_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/particles/p_gore_0.png", "assets/images/particles/p_gore_0.png");
			type.set ("assets/images/particles/p_gore_0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/preloader/corners.png", "assets/images/preloader/corners.png");
			type.set ("assets/images/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/preloader/light.png", "assets/images/preloader/light.png");
			type.set ("assets/images/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/random/left_chainsaw.png", "assets/images/random/left_chainsaw.png");
			type.set ("assets/images/random/left_chainsaw.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/random/left_chainsaw_mod.png", "assets/images/random/left_chainsaw_mod.png");
			type.set ("assets/images/random/left_chainsaw_mod.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile/autotiles.png", "assets/images/tile/autotiles.png");
			type.set ("assets/images/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile/autotiles_alt.png", "assets/images/tile/autotiles_alt.png");
			type.set ("assets/images/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/analog/base.png", "assets/images/ui/analog/base.png");
			type.set ("assets/images/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/analog/thumb.png", "assets/images/ui/analog/thumb.png");
			type.set ("assets/images/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/button.png", "assets/images/ui/button.png");
			type.set ("assets/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/countdown_1.png", "assets/images/ui/countdown_1.png");
			type.set ("assets/images/ui/countdown_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/cursor.png", "assets/images/ui/cursor.png");
			type.set ("assets/images/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/fontData11pt.png", "assets/images/ui/fontData11pt.png");
			type.set ("assets/images/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/a.png", "assets/images/ui/virtualpad/a.png");
			type.set ("assets/images/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/b.png", "assets/images/ui/virtualpad/b.png");
			type.set ("assets/images/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/c.png", "assets/images/ui/virtualpad/c.png");
			type.set ("assets/images/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/down.png", "assets/images/ui/virtualpad/down.png");
			type.set ("assets/images/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/left.png", "assets/images/ui/virtualpad/left.png");
			type.set ("assets/images/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/right.png", "assets/images/ui/virtualpad/right.png");
			type.set ("assets/images/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/up.png", "assets/images/ui/virtualpad/up.png");
			type.set ("assets/images/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/x.png", "assets/images/ui/virtualpad/x.png");
			type.set ("assets/images/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/virtualpad/y.png", "assets/images/ui/virtualpad/y.png");
			type.set ("assets/images/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.mp3", "assets/sounds/beep.mp3");
			type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.mp3", "assets/sounds/flixel.mp3");
			type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
