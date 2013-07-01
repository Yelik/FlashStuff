package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map extends Sprite
	{
		private var map:Array, mapNumber:int, mapWidth:int, mapHeight:int, converted:Boolean, saved:Array;
		
		private static var maps:Array = [], loaded:int;
		
		public function Map(map:Array, mapData:Array)
		{
			this.map = map;
			mapNumber = mapData[0];
			mapWidth = mapData[1];
			mapHeight = mapData[2];
			converted = false;
			loaded = -1;
		}
		
		public static function makeMaps():void
		{
			maps[0] = new Map([1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1], [0, 5, 5]);
			maps[1] = new Map([1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1], [1, 5, 5]);
		}
		
		public static function loadMap(mapNumber:int):void
		{
			unloadMap();
			Map(maps[mapNumber]).load();
		}
		
		public static function unloadMap():void
		{
			if (loaded != -1)
				Map(maps[loaded]).unload();
		}
		
		public function load():void
		{
			Main.i.addChild(this);
		}
		
		public function unload():void
		{
			Main.i.removeChild(this);
		}
		
		public function convertMap():void
		{
			saved = map.concat();
			var i:int;
			if (!converted)
			{
				for (var x:int = 0; x < width; x++)
				{
					for (var y:int = 0; y < height; y++)
					{
						i = getNum(x, y);
						setTile(x, y, i);
					}
				}
				for each (var t:Tile in map)
				{
					addChild(t);
				}
				converted = true;
			}
			else
			{
				throw(new Error("Already Converted Map" + mapNumber));
			}
		}
		
		public function resetMap():void
		{
			for each (var t:Tile in map)
			{
				removeChild(t);
			}
			map = saved.concat();
		}
		
		public function getTile(x:int, y:int):Tile
		{
			return map[y * width + x];
		}
		
		public function setTile(x:int, y:int, type:int):void
		{
			map[y * width + x] = new Tile(mapNumber, type);
		}
		
		public function getNum(x:int, y:int):int
		{
			return map[y * width + x];
		}
	}
}