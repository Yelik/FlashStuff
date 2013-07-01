package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map
	{
		private var map:Bitmap, mapData:BitmapData, width:int, islands:Array;
		
		public static const maxSize:int = 1000;
		
		public function Map(width:int, height:int, noise:Boolean)
		{
			mapData = new BitmapData(width, height, false, 0);
			map = new Bitmap(mapData);
			Main.i.addChild(map);
			map.scaleX = map.stage.stageWidth / width;
			map.scaleY = map.stage.stageHeight / height;
			islands = [];
			if (noise)
			{
				var b:BitmapData = new BitmapData(width, height, false, 0);
				b.perlinNoise(width, height, 7, 0, true, true);
				islands.push(b);
			}
		}
		
		public function addRandomIslands(numIslands:int, sizeIslands:int):void
		{
			for (var i:int = 0; i < numIslands; i++)
			{
				addIsland(Math.floor(Math.random() * mapData.width), Math.floor(Math.random() * mapData.height), sizeIslands);
			}
		}
		
		public function addIsland(islandX:int, islandY:int, size:int):void
		{
			var d:int, island:BitmapData = new BitmapData(mapData.width, mapData.height, false, 0);
			
			for (var x:int = -size + islandX; x <= size + islandX; x++)
			{
				for (var y:int = -size + islandY; y <= size + islandY; y++)
				{
					d = AdvMath.distance(x, y, islandX, islandY);
					if (size > d)
					{
						island.setPixel(x, y, (size - d) / maxSize * 100);
					}
				}
			}
			
			islands.push(island);
		}
		
		public function mergeIslands():void
		{
			var i:int;
			
			for (var x:int = 0; x < mapData.width; x++)
			{
				for (var y:int = 0; y < mapData.height; y++)
				{
					i = 0;
					for each (var island:BitmapData in islands)
					{
						if (i < island.getPixel(x, y))
						{
							i = island.getPixel(x, y);
						}
					}
					mapData.setPixel(x, y, i);
				}
			}
		}
	}
}