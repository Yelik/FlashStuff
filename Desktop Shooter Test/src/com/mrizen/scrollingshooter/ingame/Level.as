package com.mrizen.scrollingshooter.ingame
{
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Level
	{
		public var playerStart:Point, spawning:Boolean, spawnDelay:int, spawnList:SpawnList;
		
		public static var levels:Array;
		
		public function Level()
		{
			spawnDelay = 60;
		}
		
		public static function makeLevels():void
		{
			levels = [new Level(), new Level()];
			
			//level 1
			getLevel(1).spawnList = new SpawnList(1);
			for (var i:int = 0; i < 100; i++)
			{
				getLevel(1).spawnList.points.push(new Point(AdvMath.getBetween(IngameControl.getPlayArea()[2]), 0));
			}
			getLevel(1).spawnList.commands = [[7, -7]];
			getLevel(1).spawnList.types = [1];
			getLevel(1).spawnList.delays = [0, 0, 0, 90];
			getLevel(1).playerStart = new Point(IngameControl.mainRef.stage.stageWidth / 2, IngameControl.mainRef.stage.stageHeight - 50);
			
			//level 2
			getLevel(2).spawnList = new SpawnList(2);
			for (i = 0; i < 100; i++)
			{
				getLevel(2).spawnList.points.push(new Point(AdvMath.getBetween(IngameControl.getPlayArea()[2]), 0));
			}
			getLevel(2).spawnList.commands = [[7, -7], [7, -7], [7, -7], [7, -7], [-7, 7, 0, 0, 0, 0, -6, 7, 0, 0, 0, 0, -8, 7, 0, 0, 0, 0]];
			getLevel(2).spawnList.types = [1, 1, 1, 1, 2];
			getLevel(2).spawnList.delays = [0, 15, 0, 30, 90];
			getLevel(2).playerStart = new Point(IngameControl.mainRef.stage.stageWidth / 2, IngameControl.mainRef.stage.stageHeight - 50);
		}
		
		public static function getLevel(levelNumber:int):Level
		{
			return Level(levels[levelNumber - 1]);
		}
	}
}


