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
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/images/bkg/scr_bkg.png", __ASSET__assets_images_bkg_scr_bkg_png);
		type.set ("assets/images/bkg/scr_bkg.png", AssetType.IMAGE);
		className.set ("assets/images/bkg/scr_street.png", __ASSET__assets_images_bkg_scr_street_png);
		type.set ("assets/images/bkg/scr_street.png", AssetType.IMAGE);
		className.set ("assets/images/bkg/ul_clouds_0.png", __ASSET__assets_images_bkg_ul_clouds_0_png);
		type.set ("assets/images/bkg/ul_clouds_0.png", AssetType.IMAGE);
		className.set ("assets/images/character/bubble.png", __ASSET__assets_images_character_bubble_png);
		type.set ("assets/images/character/bubble.png", AssetType.IMAGE);
		className.set ("assets/images/character/enemy_1.png", __ASSET__assets_images_character_enemy_1_png);
		type.set ("assets/images/character/enemy_1.png", AssetType.IMAGE);
		className.set ("assets/images/character/enemy_2.png", __ASSET__assets_images_character_enemy_2_png);
		type.set ("assets/images/character/enemy_2.png", AssetType.IMAGE);
		className.set ("assets/images/character/enemy_3.png", __ASSET__assets_images_character_enemy_3_png);
		type.set ("assets/images/character/enemy_3.png", AssetType.IMAGE);
		className.set ("assets/images/character/jammer.png", __ASSET__assets_images_character_jammer_png);
		type.set ("assets/images/character/jammer.png", AssetType.IMAGE);
		className.set ("assets/images/character/jammer_death.png", __ASSET__assets_images_character_jammer_death_png);
		type.set ("assets/images/character/jammer_death.png", AssetType.IMAGE);
		className.set ("assets/images/character/zebra.png", __ASSET__assets_images_character_zebra_png);
		type.set ("assets/images/character/zebra.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/arrowLeft.png", __ASSET__assets_images_debugger_buttons_arrowleft_png);
		type.set ("assets/images/debugger/buttons/arrowLeft.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/arrowRight.png", __ASSET__assets_images_debugger_buttons_arrowright_png);
		type.set ("assets/images/debugger/buttons/arrowRight.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/bitmapLog.png", __ASSET__assets_images_debugger_buttons_bitmaplog_png);
		type.set ("assets/images/debugger/buttons/bitmapLog.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/close.png", __ASSET__assets_images_debugger_buttons_close_png);
		type.set ("assets/images/debugger/buttons/close.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/console.png", __ASSET__assets_images_debugger_buttons_console_png);
		type.set ("assets/images/debugger/buttons/console.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/drawDebug.png", __ASSET__assets_images_debugger_buttons_drawdebug_png);
		type.set ("assets/images/debugger/buttons/drawDebug.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/log.png", __ASSET__assets_images_debugger_buttons_log_png);
		type.set ("assets/images/debugger/buttons/log.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/maximize.png", __ASSET__assets_images_debugger_buttons_maximize_png);
		type.set ("assets/images/debugger/buttons/maximize.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/minimize.png", __ASSET__assets_images_debugger_buttons_minimize_png);
		type.set ("assets/images/debugger/buttons/minimize.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/open.png", __ASSET__assets_images_debugger_buttons_open_png);
		type.set ("assets/images/debugger/buttons/open.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/pause.png", __ASSET__assets_images_debugger_buttons_pause_png);
		type.set ("assets/images/debugger/buttons/pause.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/record_off.png", __ASSET__assets_images_debugger_buttons_record_off_png);
		type.set ("assets/images/debugger/buttons/record_off.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/record_on.png", __ASSET__assets_images_debugger_buttons_record_on_png);
		type.set ("assets/images/debugger/buttons/record_on.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/restart.png", __ASSET__assets_images_debugger_buttons_restart_png);
		type.set ("assets/images/debugger/buttons/restart.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/stats.png", __ASSET__assets_images_debugger_buttons_stats_png);
		type.set ("assets/images/debugger/buttons/stats.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/step.png", __ASSET__assets_images_debugger_buttons_step_png);
		type.set ("assets/images/debugger/buttons/step.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/stop.png", __ASSET__assets_images_debugger_buttons_stop_png);
		type.set ("assets/images/debugger/buttons/stop.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/toggleSize.png", __ASSET__assets_images_debugger_buttons_togglesize_png);
		type.set ("assets/images/debugger/buttons/toggleSize.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/buttons/watch.png", __ASSET__assets_images_debugger_buttons_watch_png);
		type.set ("assets/images/debugger/buttons/watch.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/flixel.png", __ASSET__assets_images_debugger_flixel_png);
		type.set ("assets/images/debugger/flixel.png", AssetType.IMAGE);
		className.set ("assets/images/debugger/windowHandle.png", __ASSET__assets_images_debugger_windowhandle_png);
		type.set ("assets/images/debugger/windowHandle.png", AssetType.IMAGE);
		className.set ("assets/images/end_screen/facebook_icon.png", __ASSET__assets_images_end_screen_facebook_icon_png);
		type.set ("assets/images/end_screen/facebook_icon.png", AssetType.IMAGE);
		className.set ("assets/images/end_screen/twitter_icon.png", __ASSET__assets_images_end_screen_twitter_icon_png);
		type.set ("assets/images/end_screen/twitter_icon.png", AssetType.IMAGE);
		className.set ("assets/images/end_screen/wheels_score.png", __ASSET__assets_images_end_screen_wheels_score_png);
		type.set ("assets/images/end_screen/wheels_score.png", AssetType.IMAGE);
		className.set ("assets/images/end_screen/youtube_icon.png", __ASSET__assets_images_end_screen_youtube_icon_png);
		type.set ("assets/images/end_screen/youtube_icon.png", AssetType.IMAGE);
		className.set ("assets/images/help_screen/arrow_down.png", __ASSET__assets_images_help_screen_arrow_down_png);
		type.set ("assets/images/help_screen/arrow_down.png", AssetType.IMAGE);
		className.set ("assets/images/help_screen/arrow_right.png", __ASSET__assets_images_help_screen_arrow_right_png);
		type.set ("assets/images/help_screen/arrow_right.png", AssetType.IMAGE);
		className.set ("assets/images/help_screen/arrow_up.png", __ASSET__assets_images_help_screen_arrow_up_png);
		type.set ("assets/images/help_screen/arrow_up.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/logo/default.png", __ASSET__assets_images_logo_default_png);
		type.set ("assets/images/logo/default.png", AssetType.IMAGE);
		className.set ("assets/images/logo/HaxeFlixel.svg", __ASSET__assets_images_logo_haxeflixel_svg);
		type.set ("assets/images/logo/HaxeFlixel.svg", AssetType.TEXT);
		className.set ("assets/images/logo/logo.png", __ASSET__assets_images_logo_logo_png);
		type.set ("assets/images/logo/logo.png", AssetType.IMAGE);
		className.set ("assets/images/particles/p_blood_0.png", __ASSET__assets_images_particles_p_blood_0_png);
		type.set ("assets/images/particles/p_blood_0.png", AssetType.IMAGE);
		className.set ("assets/images/particles/p_explosion.png", __ASSET__assets_images_particles_p_explosion_png);
		type.set ("assets/images/particles/p_explosion.png", AssetType.IMAGE);
		className.set ("assets/images/particles/p_gore_0.png", __ASSET__assets_images_particles_p_gore_0_png);
		type.set ("assets/images/particles/p_gore_0.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/corners.png", __ASSET__assets_images_preloader_corners_png);
		type.set ("assets/images/preloader/corners.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/light.png", __ASSET__assets_images_preloader_light_png);
		type.set ("assets/images/preloader/light.png", AssetType.IMAGE);
		className.set ("assets/images/random/left_chainsaw.png", __ASSET__assets_images_random_left_chainsaw_png);
		type.set ("assets/images/random/left_chainsaw.png", AssetType.IMAGE);
		className.set ("assets/images/random/left_chainsaw_mod.png", __ASSET__assets_images_random_left_chainsaw_mod_png);
		type.set ("assets/images/random/left_chainsaw_mod.png", AssetType.IMAGE);
		className.set ("assets/images/tile/autotiles.png", __ASSET__assets_images_tile_autotiles_png);
		type.set ("assets/images/tile/autotiles.png", AssetType.IMAGE);
		className.set ("assets/images/tile/autotiles_alt.png", __ASSET__assets_images_tile_autotiles_alt_png);
		type.set ("assets/images/tile/autotiles_alt.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/0.png", __ASSET__assets_images_title_screen_0_png);
		type.set ("assets/images/title_screen/0.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/1.png", __ASSET__assets_images_title_screen_1_png);
		type.set ("assets/images/title_screen/1.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/2.png", __ASSET__assets_images_title_screen_2_png);
		type.set ("assets/images/title_screen/2.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/3.png", __ASSET__assets_images_title_screen_3_png);
		type.set ("assets/images/title_screen/3.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/bkg_title_screen.png", __ASSET__assets_images_title_screen_bkg_title_screen_png);
		type.set ("assets/images/title_screen/bkg_title_screen.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/flag.png", __ASSET__assets_images_title_screen_flag_png);
		type.set ("assets/images/title_screen/flag.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/logo_frames.png", __ASSET__assets_images_title_screen_logo_frames_png);
		type.set ("assets/images/title_screen/logo_frames.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/logo_frames.rar", __ASSET__assets_images_title_screen_logo_frames_rar);
		type.set ("assets/images/title_screen/logo_frames.rar", AssetType.BINARY);
		className.set ("assets/images/title_screen/title.png", __ASSET__assets_images_title_screen_title_png);
		type.set ("assets/images/title_screen/title.png", AssetType.IMAGE);
		className.set ("assets/images/title_screen/wheel.png", __ASSET__assets_images_title_screen_wheel_png);
		type.set ("assets/images/title_screen/wheel.png", AssetType.IMAGE);
		className.set ("assets/images/ui/analog/base.png", __ASSET__assets_images_ui_analog_base_png);
		type.set ("assets/images/ui/analog/base.png", AssetType.IMAGE);
		className.set ("assets/images/ui/analog/thumb.png", __ASSET__assets_images_ui_analog_thumb_png);
		type.set ("assets/images/ui/analog/thumb.png", AssetType.IMAGE);
		className.set ("assets/images/ui/button.png", __ASSET__assets_images_ui_button_png);
		type.set ("assets/images/ui/button.png", AssetType.IMAGE);
		className.set ("assets/images/ui/countdown_1.png", __ASSET__assets_images_ui_countdown_1_png);
		type.set ("assets/images/ui/countdown_1.png", AssetType.IMAGE);
		className.set ("assets/images/ui/cursor.png", __ASSET__assets_images_ui_cursor_png);
		type.set ("assets/images/ui/cursor.png", AssetType.IMAGE);
		className.set ("assets/images/ui/fontData11pt.png", __ASSET__assets_images_ui_fontdata11pt_png);
		type.set ("assets/images/ui/fontData11pt.png", AssetType.IMAGE);
		className.set ("assets/images/ui/life_icon.png", __ASSET__assets_images_ui_life_icon_png);
		type.set ("assets/images/ui/life_icon.png", AssetType.IMAGE);
		className.set ("assets/images/ui/star_icon.png", __ASSET__assets_images_ui_star_icon_png);
		type.set ("assets/images/ui/star_icon.png", AssetType.IMAGE);
		className.set ("assets/images/ui/time_icon.png", __ASSET__assets_images_ui_time_icon_png);
		type.set ("assets/images/ui/time_icon.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/a.png", __ASSET__assets_images_ui_virtualpad_a_png);
		type.set ("assets/images/ui/virtualpad/a.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/b.png", __ASSET__assets_images_ui_virtualpad_b_png);
		type.set ("assets/images/ui/virtualpad/b.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/c.png", __ASSET__assets_images_ui_virtualpad_c_png);
		type.set ("assets/images/ui/virtualpad/c.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/down.png", __ASSET__assets_images_ui_virtualpad_down_png);
		type.set ("assets/images/ui/virtualpad/down.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/left.png", __ASSET__assets_images_ui_virtualpad_left_png);
		type.set ("assets/images/ui/virtualpad/left.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/right.png", __ASSET__assets_images_ui_virtualpad_right_png);
		type.set ("assets/images/ui/virtualpad/right.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/up.png", __ASSET__assets_images_ui_virtualpad_up_png);
		type.set ("assets/images/ui/virtualpad/up.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/x.png", __ASSET__assets_images_ui_virtualpad_x_png);
		type.set ("assets/images/ui/virtualpad/x.png", AssetType.IMAGE);
		className.set ("assets/images/ui/virtualpad/y.png", __ASSET__assets_images_ui_virtualpad_y_png);
		type.set ("assets/images/ui/virtualpad/y.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/temp/burbuja.piskel", __ASSET__assets_temp_burbuja_piskel);
		type.set ("assets/temp/burbuja.piskel", AssetType.TEXT);
		className.set ("assets/temp/charco.png", __ASSET__assets_temp_charco_png);
		type.set ("assets/temp/charco.png", AssetType.IMAGE);
		className.set ("assets/temp/ej score.jpg", __ASSET__assets_temp_ej_score_jpg);
		type.set ("assets/temp/ej score.jpg", AssetType.IMAGE);
		className.set ("assets/temp/flecha izq.png", __ASSET__assets_temp_flecha_izq_png);
		type.set ("assets/temp/flecha izq.png", AssetType.IMAGE);
		className.set ("assets/temp/FONDO_GAME.jpg", __ASSET__assets_temp_fondo_game_jpg);
		type.set ("assets/temp/FONDO_GAME.jpg", AssetType.IMAGE);
		className.set ("assets/temp/FONDO_GAME_480x1600.png", __ASSET__assets_temp_fondo_game_480x1600_png);
		type.set ("assets/temp/FONDO_GAME_480x1600.png", AssetType.IMAGE);
		className.set ("assets/temp/game over.gif", __ASSET__assets_temp_game_over_gif);
		type.set ("assets/temp/game over.gif", AssetType.IMAGE);
		className.set ("assets/temp/game-over.piskel", __ASSET__assets_temp_game_over_piskel);
		type.set ("assets/temp/game-over.piskel", AssetType.TEXT);
		className.set ("assets/temp/gatorade.png", __ASSET__assets_temp_gatorade_png);
		type.set ("assets/temp/gatorade.png", AssetType.IMAGE);
		className.set ("assets/temp/hinchada_1.png", __ASSET__assets_temp_hinchada_1_png);
		type.set ("assets/temp/hinchada_1.png", AssetType.IMAGE);
		className.set ("assets/temp/hinchada_2.png", __ASSET__assets_temp_hinchada_2_png);
		type.set ("assets/temp/hinchada_2.png", AssetType.IMAGE);
		className.set ("assets/temp/hinchada_3.png", __ASSET__assets_temp_hinchada_3_png);
		type.set ("assets/temp/hinchada_3.png", AssetType.IMAGE);
		className.set ("assets/temp/jammer_muerte.piskel", __ASSET__assets_temp_jammer_muerte_piskel);
		type.set ("assets/temp/jammer_muerte.piskel", AssetType.TEXT);
		className.set ("assets/temp/logo.jpg", __ASSET__assets_temp_logo_jpg);
		type.set ("assets/temp/logo.jpg", AssetType.IMAGE);
		className.set ("assets/temp/logopiratas.gif", __ASSET__assets_temp_logopiratas_gif);
		type.set ("assets/temp/logopiratas.gif", AssetType.IMAGE);
		className.set ("assets/temp/title_correct.png", __ASSET__assets_temp_title_correct_png);
		type.set ("assets/temp/title_correct.png", AssetType.IMAGE);
		className.set ("assets/temp/zebra.gif", __ASSET__assets_temp_zebra_gif);
		type.set ("assets/temp/zebra.gif", AssetType.IMAGE);
		className.set ("assets/temp/zebra.piskel", __ASSET__assets_temp_zebra_piskel);
		type.set ("assets/temp/zebra.piskel", AssetType.TEXT);
		className.set ("assets/temp/_p_base.png", __ASSET__assets_temp__p_base_png);
		type.set ("assets/temp/_p_base.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp4);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp4);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		type.set (id, AssetType.FONT);
		id = "assets/images/bkg/scr_bkg.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bkg/scr_street.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bkg/ul_clouds_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/bubble.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/enemy_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/enemy_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/enemy_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/jammer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/jammer_death.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/character/zebra.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/arrowLeft.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/arrowRight.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/bitmapLog.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/close.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/console.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/drawDebug.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/log.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/maximize.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/minimize.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/open.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/pause.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/record_off.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/record_on.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/restart.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/stats.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/step.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/stop.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/toggleSize.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/buttons/watch.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/flixel.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/debugger/windowHandle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/end_screen/facebook_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/end_screen/twitter_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/end_screen/wheels_score.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/end_screen/youtube_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/help_screen/arrow_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/help_screen/arrow_right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/help_screen/arrow_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/logo/default.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logo/HaxeFlixel.svg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/logo/logo.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/particles/p_blood_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/particles/p_explosion.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/particles/p_gore_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/corners.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/light.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/random/left_chainsaw.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/random/left_chainsaw_mod.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile/autotiles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile/autotiles_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/bkg_title_screen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/flag.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/logo_frames.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/logo_frames.rar";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/title_screen/title.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title_screen/wheel.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/analog/base.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/analog/thumb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/countdown_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/cursor.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/fontData11pt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/life_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/star_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/time_icon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/a.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/b.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/c.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/x.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ui/virtualpad/y.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/temp/burbuja.piskel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/temp/charco.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/ej score.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/flecha izq.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/FONDO_GAME.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/FONDO_GAME_480x1600.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/game over.gif";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/game-over.piskel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/temp/gatorade.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/hinchada_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/hinchada_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/hinchada_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/jammer_muerte.piskel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/temp/logo.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/logopiratas.gif";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/title_correct.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/zebra.gif";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/temp/zebra.piskel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/temp/_p_base.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/images/bkg/scr_bkg.png", __ASSET__assets_images_bkg_scr_bkg_png);
		type.set ("assets/images/bkg/scr_bkg.png", AssetType.IMAGE);
		
		className.set ("assets/images/bkg/scr_street.png", __ASSET__assets_images_bkg_scr_street_png);
		type.set ("assets/images/bkg/scr_street.png", AssetType.IMAGE);
		
		className.set ("assets/images/bkg/ul_clouds_0.png", __ASSET__assets_images_bkg_ul_clouds_0_png);
		type.set ("assets/images/bkg/ul_clouds_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/bubble.png", __ASSET__assets_images_character_bubble_png);
		type.set ("assets/images/character/bubble.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/enemy_1.png", __ASSET__assets_images_character_enemy_1_png);
		type.set ("assets/images/character/enemy_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/enemy_2.png", __ASSET__assets_images_character_enemy_2_png);
		type.set ("assets/images/character/enemy_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/enemy_3.png", __ASSET__assets_images_character_enemy_3_png);
		type.set ("assets/images/character/enemy_3.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/jammer.png", __ASSET__assets_images_character_jammer_png);
		type.set ("assets/images/character/jammer.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/jammer_death.png", __ASSET__assets_images_character_jammer_death_png);
		type.set ("assets/images/character/jammer_death.png", AssetType.IMAGE);
		
		className.set ("assets/images/character/zebra.png", __ASSET__assets_images_character_zebra_png);
		type.set ("assets/images/character/zebra.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/arrowLeft.png", __ASSET__assets_images_debugger_buttons_arrowleft_png);
		type.set ("assets/images/debugger/buttons/arrowLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/arrowRight.png", __ASSET__assets_images_debugger_buttons_arrowright_png);
		type.set ("assets/images/debugger/buttons/arrowRight.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/bitmapLog.png", __ASSET__assets_images_debugger_buttons_bitmaplog_png);
		type.set ("assets/images/debugger/buttons/bitmapLog.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/close.png", __ASSET__assets_images_debugger_buttons_close_png);
		type.set ("assets/images/debugger/buttons/close.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/console.png", __ASSET__assets_images_debugger_buttons_console_png);
		type.set ("assets/images/debugger/buttons/console.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/drawDebug.png", __ASSET__assets_images_debugger_buttons_drawdebug_png);
		type.set ("assets/images/debugger/buttons/drawDebug.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/log.png", __ASSET__assets_images_debugger_buttons_log_png);
		type.set ("assets/images/debugger/buttons/log.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/maximize.png", __ASSET__assets_images_debugger_buttons_maximize_png);
		type.set ("assets/images/debugger/buttons/maximize.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/minimize.png", __ASSET__assets_images_debugger_buttons_minimize_png);
		type.set ("assets/images/debugger/buttons/minimize.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/open.png", __ASSET__assets_images_debugger_buttons_open_png);
		type.set ("assets/images/debugger/buttons/open.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/pause.png", __ASSET__assets_images_debugger_buttons_pause_png);
		type.set ("assets/images/debugger/buttons/pause.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/record_off.png", __ASSET__assets_images_debugger_buttons_record_off_png);
		type.set ("assets/images/debugger/buttons/record_off.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/record_on.png", __ASSET__assets_images_debugger_buttons_record_on_png);
		type.set ("assets/images/debugger/buttons/record_on.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/restart.png", __ASSET__assets_images_debugger_buttons_restart_png);
		type.set ("assets/images/debugger/buttons/restart.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/stats.png", __ASSET__assets_images_debugger_buttons_stats_png);
		type.set ("assets/images/debugger/buttons/stats.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/step.png", __ASSET__assets_images_debugger_buttons_step_png);
		type.set ("assets/images/debugger/buttons/step.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/stop.png", __ASSET__assets_images_debugger_buttons_stop_png);
		type.set ("assets/images/debugger/buttons/stop.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/toggleSize.png", __ASSET__assets_images_debugger_buttons_togglesize_png);
		type.set ("assets/images/debugger/buttons/toggleSize.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/buttons/watch.png", __ASSET__assets_images_debugger_buttons_watch_png);
		type.set ("assets/images/debugger/buttons/watch.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/flixel.png", __ASSET__assets_images_debugger_flixel_png);
		type.set ("assets/images/debugger/flixel.png", AssetType.IMAGE);
		
		className.set ("assets/images/debugger/windowHandle.png", __ASSET__assets_images_debugger_windowhandle_png);
		type.set ("assets/images/debugger/windowHandle.png", AssetType.IMAGE);
		
		className.set ("assets/images/end_screen/facebook_icon.png", __ASSET__assets_images_end_screen_facebook_icon_png);
		type.set ("assets/images/end_screen/facebook_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/end_screen/twitter_icon.png", __ASSET__assets_images_end_screen_twitter_icon_png);
		type.set ("assets/images/end_screen/twitter_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/end_screen/wheels_score.png", __ASSET__assets_images_end_screen_wheels_score_png);
		type.set ("assets/images/end_screen/wheels_score.png", AssetType.IMAGE);
		
		className.set ("assets/images/end_screen/youtube_icon.png", __ASSET__assets_images_end_screen_youtube_icon_png);
		type.set ("assets/images/end_screen/youtube_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/help_screen/arrow_down.png", __ASSET__assets_images_help_screen_arrow_down_png);
		type.set ("assets/images/help_screen/arrow_down.png", AssetType.IMAGE);
		
		className.set ("assets/images/help_screen/arrow_right.png", __ASSET__assets_images_help_screen_arrow_right_png);
		type.set ("assets/images/help_screen/arrow_right.png", AssetType.IMAGE);
		
		className.set ("assets/images/help_screen/arrow_up.png", __ASSET__assets_images_help_screen_arrow_up_png);
		type.set ("assets/images/help_screen/arrow_up.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/logo/default.png", __ASSET__assets_images_logo_default_png);
		type.set ("assets/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("assets/images/logo/HaxeFlixel.svg", __ASSET__assets_images_logo_haxeflixel_svg);
		type.set ("assets/images/logo/HaxeFlixel.svg", AssetType.TEXT);
		
		className.set ("assets/images/logo/logo.png", __ASSET__assets_images_logo_logo_png);
		type.set ("assets/images/logo/logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/particles/p_blood_0.png", __ASSET__assets_images_particles_p_blood_0_png);
		type.set ("assets/images/particles/p_blood_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/particles/p_explosion.png", __ASSET__assets_images_particles_p_explosion_png);
		type.set ("assets/images/particles/p_explosion.png", AssetType.IMAGE);
		
		className.set ("assets/images/particles/p_gore_0.png", __ASSET__assets_images_particles_p_gore_0_png);
		type.set ("assets/images/particles/p_gore_0.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/corners.png", __ASSET__assets_images_preloader_corners_png);
		type.set ("assets/images/preloader/corners.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/light.png", __ASSET__assets_images_preloader_light_png);
		type.set ("assets/images/preloader/light.png", AssetType.IMAGE);
		
		className.set ("assets/images/random/left_chainsaw.png", __ASSET__assets_images_random_left_chainsaw_png);
		type.set ("assets/images/random/left_chainsaw.png", AssetType.IMAGE);
		
		className.set ("assets/images/random/left_chainsaw_mod.png", __ASSET__assets_images_random_left_chainsaw_mod_png);
		type.set ("assets/images/random/left_chainsaw_mod.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile/autotiles.png", __ASSET__assets_images_tile_autotiles_png);
		type.set ("assets/images/tile/autotiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile/autotiles_alt.png", __ASSET__assets_images_tile_autotiles_alt_png);
		type.set ("assets/images/tile/autotiles_alt.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/0.png", __ASSET__assets_images_title_screen_0_png);
		type.set ("assets/images/title_screen/0.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/1.png", __ASSET__assets_images_title_screen_1_png);
		type.set ("assets/images/title_screen/1.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/2.png", __ASSET__assets_images_title_screen_2_png);
		type.set ("assets/images/title_screen/2.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/3.png", __ASSET__assets_images_title_screen_3_png);
		type.set ("assets/images/title_screen/3.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/bkg_title_screen.png", __ASSET__assets_images_title_screen_bkg_title_screen_png);
		type.set ("assets/images/title_screen/bkg_title_screen.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/flag.png", __ASSET__assets_images_title_screen_flag_png);
		type.set ("assets/images/title_screen/flag.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/logo_frames.png", __ASSET__assets_images_title_screen_logo_frames_png);
		type.set ("assets/images/title_screen/logo_frames.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/logo_frames.rar", __ASSET__assets_images_title_screen_logo_frames_rar);
		type.set ("assets/images/title_screen/logo_frames.rar", AssetType.BINARY);
		
		className.set ("assets/images/title_screen/title.png", __ASSET__assets_images_title_screen_title_png);
		type.set ("assets/images/title_screen/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/title_screen/wheel.png", __ASSET__assets_images_title_screen_wheel_png);
		type.set ("assets/images/title_screen/wheel.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/analog/base.png", __ASSET__assets_images_ui_analog_base_png);
		type.set ("assets/images/ui/analog/base.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/analog/thumb.png", __ASSET__assets_images_ui_analog_thumb_png);
		type.set ("assets/images/ui/analog/thumb.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/button.png", __ASSET__assets_images_ui_button_png);
		type.set ("assets/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/countdown_1.png", __ASSET__assets_images_ui_countdown_1_png);
		type.set ("assets/images/ui/countdown_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/cursor.png", __ASSET__assets_images_ui_cursor_png);
		type.set ("assets/images/ui/cursor.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/fontData11pt.png", __ASSET__assets_images_ui_fontdata11pt_png);
		type.set ("assets/images/ui/fontData11pt.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/life_icon.png", __ASSET__assets_images_ui_life_icon_png);
		type.set ("assets/images/ui/life_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/star_icon.png", __ASSET__assets_images_ui_star_icon_png);
		type.set ("assets/images/ui/star_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/time_icon.png", __ASSET__assets_images_ui_time_icon_png);
		type.set ("assets/images/ui/time_icon.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/a.png", __ASSET__assets_images_ui_virtualpad_a_png);
		type.set ("assets/images/ui/virtualpad/a.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/b.png", __ASSET__assets_images_ui_virtualpad_b_png);
		type.set ("assets/images/ui/virtualpad/b.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/c.png", __ASSET__assets_images_ui_virtualpad_c_png);
		type.set ("assets/images/ui/virtualpad/c.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/down.png", __ASSET__assets_images_ui_virtualpad_down_png);
		type.set ("assets/images/ui/virtualpad/down.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/left.png", __ASSET__assets_images_ui_virtualpad_left_png);
		type.set ("assets/images/ui/virtualpad/left.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/right.png", __ASSET__assets_images_ui_virtualpad_right_png);
		type.set ("assets/images/ui/virtualpad/right.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/up.png", __ASSET__assets_images_ui_virtualpad_up_png);
		type.set ("assets/images/ui/virtualpad/up.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/x.png", __ASSET__assets_images_ui_virtualpad_x_png);
		type.set ("assets/images/ui/virtualpad/x.png", AssetType.IMAGE);
		
		className.set ("assets/images/ui/virtualpad/y.png", __ASSET__assets_images_ui_virtualpad_y_png);
		type.set ("assets/images/ui/virtualpad/y.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/temp/burbuja.piskel", __ASSET__assets_temp_burbuja_piskel);
		type.set ("assets/temp/burbuja.piskel", AssetType.TEXT);
		
		className.set ("assets/temp/charco.png", __ASSET__assets_temp_charco_png);
		type.set ("assets/temp/charco.png", AssetType.IMAGE);
		
		className.set ("assets/temp/ej score.jpg", __ASSET__assets_temp_ej_score_jpg);
		type.set ("assets/temp/ej score.jpg", AssetType.IMAGE);
		
		className.set ("assets/temp/flecha izq.png", __ASSET__assets_temp_flecha_izq_png);
		type.set ("assets/temp/flecha izq.png", AssetType.IMAGE);
		
		className.set ("assets/temp/FONDO_GAME.jpg", __ASSET__assets_temp_fondo_game_jpg);
		type.set ("assets/temp/FONDO_GAME.jpg", AssetType.IMAGE);
		
		className.set ("assets/temp/FONDO_GAME_480x1600.png", __ASSET__assets_temp_fondo_game_480x1600_png);
		type.set ("assets/temp/FONDO_GAME_480x1600.png", AssetType.IMAGE);
		
		className.set ("assets/temp/game over.gif", __ASSET__assets_temp_game_over_gif);
		type.set ("assets/temp/game over.gif", AssetType.IMAGE);
		
		className.set ("assets/temp/game-over.piskel", __ASSET__assets_temp_game_over_piskel);
		type.set ("assets/temp/game-over.piskel", AssetType.TEXT);
		
		className.set ("assets/temp/gatorade.png", __ASSET__assets_temp_gatorade_png);
		type.set ("assets/temp/gatorade.png", AssetType.IMAGE);
		
		className.set ("assets/temp/hinchada_1.png", __ASSET__assets_temp_hinchada_1_png);
		type.set ("assets/temp/hinchada_1.png", AssetType.IMAGE);
		
		className.set ("assets/temp/hinchada_2.png", __ASSET__assets_temp_hinchada_2_png);
		type.set ("assets/temp/hinchada_2.png", AssetType.IMAGE);
		
		className.set ("assets/temp/hinchada_3.png", __ASSET__assets_temp_hinchada_3_png);
		type.set ("assets/temp/hinchada_3.png", AssetType.IMAGE);
		
		className.set ("assets/temp/jammer_muerte.piskel", __ASSET__assets_temp_jammer_muerte_piskel);
		type.set ("assets/temp/jammer_muerte.piskel", AssetType.TEXT);
		
		className.set ("assets/temp/logo.jpg", __ASSET__assets_temp_logo_jpg);
		type.set ("assets/temp/logo.jpg", AssetType.IMAGE);
		
		className.set ("assets/temp/logopiratas.gif", __ASSET__assets_temp_logopiratas_gif);
		type.set ("assets/temp/logopiratas.gif", AssetType.IMAGE);
		
		className.set ("assets/temp/title_correct.png", __ASSET__assets_temp_title_correct_png);
		type.set ("assets/temp/title_correct.png", AssetType.IMAGE);
		
		className.set ("assets/temp/zebra.gif", __ASSET__assets_temp_zebra_gif);
		type.set ("assets/temp/zebra.gif", AssetType.IMAGE);
		
		className.set ("assets/temp/zebra.piskel", __ASSET__assets_temp_zebra_piskel);
		type.set ("assets/temp/zebra.piskel", AssetType.TEXT);
		
		className.set ("assets/temp/_p_base.png", __ASSET__assets_temp__p_base_png);
		type.set ("assets/temp/_p_base.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp4);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp4);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
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

@:keep class __ASSET__assets_data_data_goes_here_txt extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { }
@:keep class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { }
@:keep class __ASSET__assets_images_bkg_scr_bkg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_bkg_scr_street_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_bkg_ul_clouds_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_bubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_enemy_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_enemy_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_enemy_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_jammer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_jammer_death_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_character_zebra_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_arrowleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_arrowright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_bitmaplog_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_close_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_drawdebug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_log_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_maximize_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_minimize_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_stats_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_togglesize_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_buttons_watch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_end_screen_facebook_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_end_screen_twitter_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_end_screen_wheels_score_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_end_screen_youtube_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_help_screen_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_help_screen_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_help_screen_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_images_go_here_txt extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_logo_haxeflixel_svg extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_images_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_particles_p_blood_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_particles_p_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_particles_p_gore_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_random_left_chainsaw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_random_left_chainsaw_mod_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_bkg_title_screen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_flag_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_logo_frames_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_logo_frames_rar extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_images_title_screen_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_title_screen_wheel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_countdown_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_life_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_star_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_time_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_music_music_goes_here_txt extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_sounds_beep_mp3 extends openfl.media.Sound { }
@:keep class __ASSET__assets_sounds_beep_ogg extends openfl.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends openfl.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_ogg extends openfl.media.Sound { }
@:keep class __ASSET__assets_sounds_sounds_go_here_txt extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_temp_burbuja_piskel extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_temp_charco_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_ej_score_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_flecha_izq_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_fondo_game_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_fondo_game_480x1600_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_game_over_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_game_over_piskel extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_temp_gatorade_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_hinchada_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_hinchada_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_hinchada_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_jammer_muerte_piskel extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_temp_logo_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_logopiratas_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_title_correct_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_zebra_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_temp_zebra_piskel extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_temp__p_base_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sounds_beep_mp4 extends openfl.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp4 extends openfl.media.Sound { }


#elseif html5


@:keep class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "assets/fonts/arial.ttf"; } #end }
@:keep class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "assets/fonts/nokiafc22.ttf"; } #end }












































































































#elseif (windows || mac || linux)


@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray {}
@:font("assets/fonts/arial.ttf") class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}
@:font("assets/fonts/nokiafc22.ttf") class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:bitmap("assets/images/bkg/scr_bkg.png") class __ASSET__assets_images_bkg_scr_bkg_png extends flash.display.BitmapData {}
@:bitmap("assets/images/bkg/scr_street.png") class __ASSET__assets_images_bkg_scr_street_png extends flash.display.BitmapData {}
@:bitmap("assets/images/bkg/ul_clouds_0.png") class __ASSET__assets_images_bkg_ul_clouds_0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/bubble.png") class __ASSET__assets_images_character_bubble_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/enemy_1.png") class __ASSET__assets_images_character_enemy_1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/enemy_2.png") class __ASSET__assets_images_character_enemy_2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/enemy_3.png") class __ASSET__assets_images_character_enemy_3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/jammer.png") class __ASSET__assets_images_character_jammer_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/jammer_death.png") class __ASSET__assets_images_character_jammer_death_png extends flash.display.BitmapData {}
@:bitmap("assets/images/character/zebra.png") class __ASSET__assets_images_character_zebra_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/arrowLeft.png") class __ASSET__assets_images_debugger_buttons_arrowleft_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/arrowRight.png") class __ASSET__assets_images_debugger_buttons_arrowright_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/bitmapLog.png") class __ASSET__assets_images_debugger_buttons_bitmaplog_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/close.png") class __ASSET__assets_images_debugger_buttons_close_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/console.png") class __ASSET__assets_images_debugger_buttons_console_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/drawDebug.png") class __ASSET__assets_images_debugger_buttons_drawdebug_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/log.png") class __ASSET__assets_images_debugger_buttons_log_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/maximize.png") class __ASSET__assets_images_debugger_buttons_maximize_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/minimize.png") class __ASSET__assets_images_debugger_buttons_minimize_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/open.png") class __ASSET__assets_images_debugger_buttons_open_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/pause.png") class __ASSET__assets_images_debugger_buttons_pause_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/record_off.png") class __ASSET__assets_images_debugger_buttons_record_off_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/record_on.png") class __ASSET__assets_images_debugger_buttons_record_on_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/restart.png") class __ASSET__assets_images_debugger_buttons_restart_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/stats.png") class __ASSET__assets_images_debugger_buttons_stats_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/step.png") class __ASSET__assets_images_debugger_buttons_step_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/stop.png") class __ASSET__assets_images_debugger_buttons_stop_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/toggleSize.png") class __ASSET__assets_images_debugger_buttons_togglesize_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/buttons/watch.png") class __ASSET__assets_images_debugger_buttons_watch_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/flixel.png") class __ASSET__assets_images_debugger_flixel_png extends flash.display.BitmapData {}
@:bitmap("assets/images/debugger/windowHandle.png") class __ASSET__assets_images_debugger_windowhandle_png extends flash.display.BitmapData {}
@:bitmap("assets/images/end_screen/facebook_icon.png") class __ASSET__assets_images_end_screen_facebook_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/end_screen/twitter_icon.png") class __ASSET__assets_images_end_screen_twitter_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/end_screen/wheels_score.png") class __ASSET__assets_images_end_screen_wheels_score_png extends flash.display.BitmapData {}
@:bitmap("assets/images/end_screen/youtube_icon.png") class __ASSET__assets_images_end_screen_youtube_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/help_screen/arrow_down.png") class __ASSET__assets_images_help_screen_arrow_down_png extends flash.display.BitmapData {}
@:bitmap("assets/images/help_screen/arrow_right.png") class __ASSET__assets_images_help_screen_arrow_right_png extends flash.display.BitmapData {}
@:bitmap("assets/images/help_screen/arrow_up.png") class __ASSET__assets_images_help_screen_arrow_up_png extends flash.display.BitmapData {}
@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray {}
@:bitmap("assets/images/logo/default.png") class __ASSET__assets_images_logo_default_png extends flash.display.BitmapData {}
@:file("assets/images/logo/HaxeFlixel.svg") class __ASSET__assets_images_logo_haxeflixel_svg extends flash.utils.ByteArray {}
@:bitmap("assets/images/logo/logo.png") class __ASSET__assets_images_logo_logo_png extends flash.display.BitmapData {}
@:bitmap("assets/images/particles/p_blood_0.png") class __ASSET__assets_images_particles_p_blood_0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/particles/p_explosion.png") class __ASSET__assets_images_particles_p_explosion_png extends flash.display.BitmapData {}
@:bitmap("assets/images/particles/p_gore_0.png") class __ASSET__assets_images_particles_p_gore_0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/preloader/corners.png") class __ASSET__assets_images_preloader_corners_png extends flash.display.BitmapData {}
@:bitmap("assets/images/preloader/light.png") class __ASSET__assets_images_preloader_light_png extends flash.display.BitmapData {}
@:bitmap("assets/images/random/left_chainsaw.png") class __ASSET__assets_images_random_left_chainsaw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/random/left_chainsaw_mod.png") class __ASSET__assets_images_random_left_chainsaw_mod_png extends flash.display.BitmapData {}
@:bitmap("assets/images/tile/autotiles.png") class __ASSET__assets_images_tile_autotiles_png extends flash.display.BitmapData {}
@:bitmap("assets/images/tile/autotiles_alt.png") class __ASSET__assets_images_tile_autotiles_alt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/0.png") class __ASSET__assets_images_title_screen_0_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/1.png") class __ASSET__assets_images_title_screen_1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/2.png") class __ASSET__assets_images_title_screen_2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/3.png") class __ASSET__assets_images_title_screen_3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/bkg_title_screen.png") class __ASSET__assets_images_title_screen_bkg_title_screen_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/flag.png") class __ASSET__assets_images_title_screen_flag_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/logo_frames.png") class __ASSET__assets_images_title_screen_logo_frames_png extends flash.display.BitmapData {}
@:file("assets/images/title_screen/logo_frames.rar") class __ASSET__assets_images_title_screen_logo_frames_rar extends flash.utils.ByteArray {}
@:bitmap("assets/images/title_screen/title.png") class __ASSET__assets_images_title_screen_title_png extends flash.display.BitmapData {}
@:bitmap("assets/images/title_screen/wheel.png") class __ASSET__assets_images_title_screen_wheel_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/analog/base.png") class __ASSET__assets_images_ui_analog_base_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/analog/thumb.png") class __ASSET__assets_images_ui_analog_thumb_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/button.png") class __ASSET__assets_images_ui_button_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/countdown_1.png") class __ASSET__assets_images_ui_countdown_1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/cursor.png") class __ASSET__assets_images_ui_cursor_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/fontData11pt.png") class __ASSET__assets_images_ui_fontdata11pt_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/life_icon.png") class __ASSET__assets_images_ui_life_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/star_icon.png") class __ASSET__assets_images_ui_star_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/time_icon.png") class __ASSET__assets_images_ui_time_icon_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/a.png") class __ASSET__assets_images_ui_virtualpad_a_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/b.png") class __ASSET__assets_images_ui_virtualpad_b_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/c.png") class __ASSET__assets_images_ui_virtualpad_c_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/down.png") class __ASSET__assets_images_ui_virtualpad_down_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/left.png") class __ASSET__assets_images_ui_virtualpad_left_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/right.png") class __ASSET__assets_images_ui_virtualpad_right_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/up.png") class __ASSET__assets_images_ui_virtualpad_up_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/x.png") class __ASSET__assets_images_ui_virtualpad_x_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ui/virtualpad/y.png") class __ASSET__assets_images_ui_virtualpad_y_png extends flash.display.BitmapData {}
@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray {}
@:sound("assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("assets/sounds/beep.ogg") class __ASSET__assets_sounds_beep_ogg extends flash.media.Sound {}
@:sound("assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}
@:sound("assets/sounds/flixel.ogg") class __ASSET__assets_sounds_flixel_ogg extends flash.media.Sound {}
@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray {}
@:file("assets/temp/burbuja.piskel") class __ASSET__assets_temp_burbuja_piskel extends flash.utils.ByteArray {}
@:bitmap("assets/temp/charco.png") class __ASSET__assets_temp_charco_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/ej score.jpg") class __ASSET__assets_temp_ej_score_jpg extends flash.display.BitmapData {}
@:bitmap("assets/temp/flecha izq.png") class __ASSET__assets_temp_flecha_izq_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/FONDO_GAME.jpg") class __ASSET__assets_temp_fondo_game_jpg extends flash.display.BitmapData {}
@:bitmap("assets/temp/FONDO_GAME_480x1600.png") class __ASSET__assets_temp_fondo_game_480x1600_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/game over.gif") class __ASSET__assets_temp_game_over_gif extends flash.display.BitmapData {}
@:file("assets/temp/game-over.piskel") class __ASSET__assets_temp_game_over_piskel extends flash.utils.ByteArray {}
@:bitmap("assets/temp/gatorade.png") class __ASSET__assets_temp_gatorade_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/hinchada_1.png") class __ASSET__assets_temp_hinchada_1_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/hinchada_2.png") class __ASSET__assets_temp_hinchada_2_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/hinchada_3.png") class __ASSET__assets_temp_hinchada_3_png extends flash.display.BitmapData {}
@:file("assets/temp/jammer_muerte.piskel") class __ASSET__assets_temp_jammer_muerte_piskel extends flash.utils.ByteArray {}
@:bitmap("assets/temp/logo.jpg") class __ASSET__assets_temp_logo_jpg extends flash.display.BitmapData {}
@:bitmap("assets/temp/logopiratas.gif") class __ASSET__assets_temp_logopiratas_gif extends flash.display.BitmapData {}
@:bitmap("assets/temp/title_correct.png") class __ASSET__assets_temp_title_correct_png extends flash.display.BitmapData {}
@:bitmap("assets/temp/zebra.gif") class __ASSET__assets_temp_zebra_gif extends flash.display.BitmapData {}
@:file("assets/temp/zebra.piskel") class __ASSET__assets_temp_zebra_piskel extends flash.utils.ByteArray {}
@:bitmap("assets/temp/_p_base.png") class __ASSET__assets_temp__p_base_png extends flash.display.BitmapData {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,4/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp4 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,4/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp4 extends flash.media.Sound {}


#end
