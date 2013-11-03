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
		private var points:Vector.<Point>
		
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
			points = new Vector.<Point>;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			points.push(new Point(Math.random() * (stage.stageWidth - points.length / 4), Math.random() * (stage.stageHeight - points.length / 4)));
			draw();
		}
		
		private function draw(e:Event = null):void
		{
			if (points.length < 2)
			{
				return;
			}
			graphics.clear();
			for (var i:int = 0; i < points.length - 1; i++)
			{
				var p1:Point = points[i], p2:Point = points[i + 1];
				graphics.lineStyle(points.length / 10, 0xFFFFFF * (128 + p1.x - p2.x) * 0xFFFFFF * (128 + p1.y - p2.y));
				graphics.moveTo(p1.x, p1.y);
				graphics.lineTo(p2.x, p2.y);
			}
		}
	}
}