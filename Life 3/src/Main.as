package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var mapData:BitmapData;
		private var map:Bitmap
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			mapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0x00);
			map = new Bitmap(mapData);
			addChild(map);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
			
			for (var x:int = 0; x < stage.stageWidth; x++)
			{
				for (var y:int = 0; y < stage.stageHeight; y++)
				{
					mapData.setPixel(x, y, x * y);
				}
			}
		}
		
		private function enterFrame(e:Event):void
		{
			var copyMap:BitmapData = mapData.clone();
			for (var x:int = 0; x < stage.stageWidth; x++)
			{
				for (var y:int = 0; y < stage.stageHeight; y++)
				{
					var totalLife:int = getTotalLife(x, y);
					if (totalLife > 0xFF)
					{
						totalLife *= 2;
					}
					if (totalLife > 0xFFFF)
					{
						totalLife *= 0;
					}
					copyMap.setPixel(x, y, totalLife / 3);
				}
			}
			removeChild(map);
			mapData = copyMap;
			map = new Bitmap(mapData);
			addChild(map);
		}
		
		private function getTotalLife(x:int, y:int):int
		{
			var i:int = 0;
			
			if (x > 0)
			{
				i += mapData.getPixel(x - 1, y);
			}
			
			if (y > 0)
			{
				i += mapData.getPixel(x, y - 1);
			}
			
			if (x < mapData.width - 1)
			{
				i += mapData.getPixel(x + 1, y);
			}
			
			if (y < mapData.height - 1)
			{
				i += mapData.getPixel(x, y + 1);
			}
			
			return i;
		}
	}
}