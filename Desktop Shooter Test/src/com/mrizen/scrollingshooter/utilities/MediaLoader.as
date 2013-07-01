package com.mrizen.scrollingshooter.utilities
{
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class MediaLoader
	{
		[Embed(source="../../../../../lib/ingame/player.png")]
		public static var ingamePlayer:Class;
		
		[Embed(source="../../../../../lib/ingame/bullet.png")]
		public static var ingameBullet:Class;
		
		[Embed(source="../../../../../lib/ingame/enemy1.png")]
		public static var ingameEnemy1:Class;
		
		[Embed(source = "../../../../../lib/ingame/enemy2.png")]
		public static var ingameEnemy2:Class;
		
		[Embed(source="../../../../../lib/ingame/back.png")]
		public static var ingameBack:Class;
		
		[Embed(source="../../../../../lib/mainmenu/title.png")]
		public static var mainmenuBack:Class;
		
		[Embed(source="../../../../../lib/mainmenu/help.png")]
		public static var mainmenuHelp:Class;
		
		[Embed(source="../../../../../lib/mainmenu/play.png")]
		public static var mainmenuPlay:Class;
		
		[Embed(source="../../../../../lib/help/title.png")]
		public static var helpBack:Class;
		
		[Embed(source="../../../../../lib/help/main.png")]
		public static var helpMain:Class;
		
		[Embed(source="../../../../../lib/levelmenu/title.png")]
		public static var levelmenuTitle:Class;
		
		[Embed(source = "../../../../../lib/levelmenu/level.png")]
		public static var levelmenuLevel:Class;
		
		[Embed(source="../../../../../lib/sounds/themesong.mp3")]
		public static var themesong:Class;
		
		public function MediaLoader()
		{
		
		}
	
	}

}


