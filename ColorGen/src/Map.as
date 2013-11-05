package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map extends Sprite
	{
		private var map:Bitmap, mapData:BitmapData, i:int, iMax:int, iMin:int, mapDatas:Array;
		
		public function Map(width:int, height:int)
		{
			mapData = new BitmapData(width, height, false, 0);
			map = new Bitmap(mapData);
			mapDatas = new Array();
			i = 0;
			iMax = 24;
			iMin = 0;
			addChild(map);
		}
		
		public function generate():void
		{
			for (i = iMin; i < iMax; i++)
			{
				for (var x:int = 0; x < mapData.width; x++)
				{
					for (var y:int = 0; y < mapData.height; y++)
					{
						mapData.setPixel(x, y, (x * 100) / y << i);
						//mapData.setPixel(y, x, (x * 100) / y << i);
						
						//mapData.setPixel(x, y, (x % y) * (y % x) << i);
						
						//mapData.setPixel(x, y, (x * y) - (x + y) << i % 24);
					}
				}
				mapDatas[i] = mapData.clone();
			}
		}
		
		public function next():void
		{
			var m:BitmapData = mapDatas[i];
			removeChild(map);
			map = new Bitmap(m);
			addChild(map);
			i++;
			if (i > iMax)
				i = iMin;
		}
	}
}