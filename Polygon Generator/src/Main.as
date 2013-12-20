package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var points:Vector.<Point>;
		
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
			
			points = new Vector.<Point>
			var dotsWidth:int = 10;
			var dotsHeight:int = 10;
			var xOffset:int = 10;
			var yOffset:int = 10;
			var size:int = 1;
			
			for (var y:int = 0; y < dotsHeight; y++)
			{
				for (var x:int = 0; x < dotsWidth; x++)
				{
					addP(x * stage.stageWidth / dotsWidth + Math.floor(Math.random() * xOffset * 2) - xOffset, y * stage.stageHeight / dotsHeight + Math.floor(Math.random() * yOffset * 2) - yOffset);
				}
			}
			
			graphics.lineStyle(1);
			for (var i:int = 0; i < points.length - 1; i++)
			{
				var same:Point = points[i];
				var next:Point = points[i + 1];
				graphics.moveTo(same.x, same.y);
				graphics.lineTo((next.x + same.x) / 2, (next.y + same.y) / 2);
			}
		
		}
		
		private function addP(x:int, y:int):void
		{
			points.push(new Point(x, y));
		}
	
	}

}