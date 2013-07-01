package
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Tree extends Sprite
	{
		private var points:Vector.<Point>
		
		public function Tree()
		{
			points = new Vector.<Point>;
			addPoint(0, 0);
			addPoint(-10, -20);
			addPoint(0, -30);
			addPoint(10, -20);
			addPoint(0, 0);
			draw();
		}
		
		private function addPoint(x:int, y:int):void
		{
			points.push(new Point(x, y));
		}
		
		private function draw():void
		{
			graphics.clear();
			graphics.lineStyle(1);
			graphics.beginFill(0xFFFFFF, 0.5);
			graphics.moveTo(points[0].x, points[0].y);
			for each (var p:Point in points)
			{
				graphics.lineTo(p.x, p.y);
			}
		}
	}
}