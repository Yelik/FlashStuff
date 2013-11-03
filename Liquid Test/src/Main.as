package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var map:Bitmap;
		private var mapData1:BitmapData;
		private var mapData2:BitmapData;
		private var mapData:BitmapData;
		
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
			mapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0);
			mapData1 = mapData.clone();
			map = new Bitmap(mapData);
			addChild(map);
			
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event = null):void
		{
			mapData1.setPixel(stage.stageWidth / 2, stage.stageHeight / 2, 0xFF);
			mapData2 = mapData1.clone();
			for (var x:int = 0; x < stage.stageWidth; x++)
			{
				for (var y:int = 0; y < stage.stageHeight; y++)
				{
					var size1:int = mapData.getPixel(x, y);
					var size2:int = mapData.getPixel(x - 1, y);
					var size3:int = mapData.getPixel(x + 1, y - 1);
					var size4:int = mapData.getPixel(x + 1, y + 1);
					var totalSize:int = size1 + size2 + size3 + size4;
					if (totalSize < 3) {
						
						mapData2.setPixel(x, y, totalSize / 4);
					}
				}
			}
			mapData.copyPixels(mapData2, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), new Point());
		}
	}
}