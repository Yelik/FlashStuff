package com.mrizen.world
{
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class FlowControl
	{
		private static var 
			mainRef:Main,
			stageRef:Stage,
			kongRef:KongregateLoader,
			worldRef:World,
			worldMapRef:Array,
			id:uint = 0;
		
		public function FlowControl(main:Main)
		{
			mainRef = main;
			stageRef = main.stage;
			kongRef = new KongregateLoader();
			
			worldRef = new World(200, 200);
			worldMapRef = worldRef.getMap();
			
			worldRef.addToStage();
		}
		
		public static function nextId():uint
		{
			id++;
			return id;
		}
		
		public static function tick():void
		{
			worldRef.tick();
		}
		
		public static function getMain():Main
		{
			return mainRef;
		}
		
		public static function getStage():Stage
		{
			return stageRef;
		}
		
		public static function getKong():KongregateLoader
		{
			return kongRef;
		}
		
		public static function getWorld():World
		{
			return worldRef;
		}
		
		public static function getWorldMap():Array
		{
			return worldMapRef;
		}
	}
}