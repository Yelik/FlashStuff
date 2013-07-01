package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private var dots:Array, mapData:BitmapData, map:Bitmap;
		
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
			
			var spreadAmount:int = 10;
			
			dots = [new Dot(0, 0, new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0))];
			mapData = new BitmapData(spreadAmount + 1, spreadAmount + 1, false, 0); //stage.stageWidth, stage.stageHeight
			spread(spreadAmount);
			map = new Bitmap(mapData);
			map.scaleX = stage.stageWidth / mapData.width;
			map.scaleY = stage.stageHeight / mapData.height;
			addChild(map);
		}
		
		private function spread(distance:Number):void
		{
			print();
			for (var i:int = 0; i < distance; i++)
			{
				var dots2:Array = [];
				for (var i1:int = 0; i1 < dots.length; i1++)
					dots2 = dots2.concat(getNeighbors(dots[i1]));
				dots = dots2;
				dots = preen(dots);
				print();
			}
		}
		
		private function preen(array:Array):Array
		{
			for (var i:uint = array.length; i > 0; i--)
			{
				if ()
				{
					array.splice(i - 1, 1);
				}
			}
			return array;
		}
		
		private function print():void
		{
			for each (var d:Dot in dots)
			{
				//trace(d, d.getRed());
				//d.setRed(d.getRed() + 1);
				mapData.setPixel(d.x, d.y, d.getColor());
			}
		}
		
		private function getNeighbors(d:Dot):Array
		{
			var a:Array = [];
			if (d.x < mapData.width - 1)
				a.push(new Dot(d.x + 1, d.y, d.getColorTransform()));
			if (d.y < mapData.height - 1)
				a.push(new Dot(d.x, d.y + 1, d.getColorTransform()));
			return a;
		}
	}
}