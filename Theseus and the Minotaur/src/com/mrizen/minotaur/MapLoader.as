package com.mrizen.minotaur
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class MapLoader extends Sprite
	{
		private static var level1:Array;
		private static var level1Info:Array;
		private static var level2:Array;
		private static var level2Info:Array;
		private static var level3:Array;
		private static var level3Info:Array;
		private static var level4:Array;
		private static var level4Info:Array;
		private static var level5:Array;
		private static var level5Info:Array;
		private static var level6:Array;
		private static var level6Info:Array;
		private static var level7:Array;
		private static var level7Info:Array;
		private static var level8:Array;
		private static var level8Info:Array;
		private static var level9:Array;
		private static var level9Info:Array;
		private static var level10:Array;
		private static var level10Info:Array;
		
		public static var units:Array;
		public static var currentMap:Array;
		public static const lastMapNumber:uint = 5;
		
		public function MapLoader()
		{
			units = new Array();
			makeMaps();
		}
		
		private function makeMaps():void
		{
			level1 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 3, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 2, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			level1Info = [1, 10, 10, []];
			level2 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 3, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			level2Info = [2, 10, 10, []];
			level3 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 1, 3, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			level3Info = [3, 12, 12, []];
			level4 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 3, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			level4Info = [4, 15, 15, []];
			level5 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 3, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 6, 1, 6, 1, 0, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			level5Info = [5, 8, [[3, 3], [6, 3], [1, 3]]];
		}
		
		private function convertLevel(level:Array, levelInfo:Array):void
		{
			var portalNumber:uint = 0;
			for (var j:uint = 0; j < levelInfo[1]; j++)
			{
				for (var k:uint = 0; k < levelInfo[1]; k++)
				{
					var spot:uint = (j * levelInfo[1]) + k;
					if (level[spot] == 6)
					{
						level[spot] = new Portal(j, k, levelInfo[0], portalNumber);
						portalNumber++;
					}
					else
					{
						level[spot] = new Tile(j, k, level[spot], levelInfo[0]);
					}
				}
			}
		}
		
		private function loadLevel(level:Array):void
		{
			currentMap = level;
			for each (var tile:Tile in level)
			{
				addChild(tile);
				tile.setReady(true);
				if (tile.getType() == Tile.typeStart)
				{
					units.push(new Player(tile, units.length));
				}
				else if (tile.getType() == Tile.typeEnd)
				{
					units.push(new Minotaur(tile, units.length));
				}
			}
			for each (var unit:Unit in units)
			{
				addChild(unit);
			}
		}
		
		public function loadMap(mapNumber:uint):void
		{
			switch (mapNumber)
			{
				case 1: 
					convertLevel(level1, level1Info);
					loadLevel(level1);
					break;
				
				case 2: 
					convertLevel(level2, level2Info);
					loadLevel(level2);
					break;
				
				case 3: 
					convertLevel(level3, level3Info);
					loadLevel(level3);
					break;
				
				case 4: 
					convertLevel(level4, level4Info);
					loadLevel(level4);
					break;
				
				case 5: 
					convertLevel(level5, level5Info);
					loadLevel(level5);
					break;
				
				default: 
					trace("Map not found.");
			}
		}
		
		public function unloadMap():void
		{
			while (numChildren >= 1)
			{
				removeChildAt(0);
			}
			units = [];
			makeMaps();
		}
		
		public static function getLevelInfo(levelNumber:uint):Array
		{
			var levelInfo:Array;
			switch (levelNumber)
			{
				case 1: 
					levelInfo = level1Info;
					break;
				
				case 2: 
					levelInfo = level2Info;
					break;
				
				case 3: 
					levelInfo = level3Info;
					break;
				
				case 4: 
					levelInfo = level4Info;
					break;
				
				case 5: 
					levelInfo = level5Info;
					break;
				
				case 6: 
					levelInfo = level6Info;
					break;
				
				case 7: 
					levelInfo = level7Info;
					break;
				
				case 8: 
					levelInfo = level8Info;
					break;
				
				case 9: 
					levelInfo = level9Info;
					break;
				
				case 10: 
					levelInfo = level10Info;
					break;
			}
			
			return levelInfo;
		}
		
		public static function getLevel(levelNumber:uint):Array
		{
			var level:Array;
			switch (levelNumber)
			{
				
				case 1: 
					level = level1;
					break;
				
				case 2: 
					level = level2;
					break;
				
				case 3: 
					level = level3;
					break;
				
				case 4: 
					level = level4;
					break;
				
				case 5: 
					level = level5;
					break;
				
				case 6: 
					level = level6;
					break;
				
				case 7: 
					level = level7;
					break;
				
				case 8: 
					level = level8;
					break;
				
				case 9: 
					level = level9;
					break;
				
				case 10: 
					level = level10;
					break;
			}
			
			return level;
		}
	}
}