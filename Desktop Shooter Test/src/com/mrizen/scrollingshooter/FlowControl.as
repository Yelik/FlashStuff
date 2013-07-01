package com.mrizen.scrollingshooter
{
	import com.mrizen.scrollingshooter.ingame.*;
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.media.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class FlowControl
	{
		protected static var ingame:IngameControl, mainMenu:MainMenu, fps:FPSCounter, help:Help, levelMenu:LevelMenu;
		
		public static var mainRef:Main, kongLoader:KongregateLoader;
		
		public function FlowControl(main:Main)
		{
			mainRef = main;
			new MediaLoader();
			var themesong:Sound = new MediaLoader.themesong();
			themesong.play();
			//kongLoader = new KongregateLoader();
			fps = new FPSCounter(0, 0, 0xFFFFFFFF);
			mainRef.addChild(fps);
			
			ingame = new IngameControl();
			mainMenu = new MainMenu();
			help = new Help();
			levelMenu = new LevelMenu();
			
			mainMenu.load();
		}
		
		public static function loadHelp():void
		{
			help.load();
		}
		
		public static function loadMainMenu():void
		{
			mainMenu.load();
		}
		
		public static function loadNextLevel():void
		{
			ingame.load();
		}
		
		public static function loadLevel(levelNumber:int):void
		{
			ingame.loadLevel(levelNumber);
		}
		
		public static function loadLevelMenu():void
		{
			levelMenu.load();
		}
		
		public static function upFPS():void
		{
			mainRef.setChildIndex(fps, mainRef.numChildren - 1)
		}
	}
}
