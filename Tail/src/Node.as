package
{
	import flash.display.Shape;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Node extends Shape
	{
		private var following:Node, size:int, speed:Array, point:Array, friction:int;
		
		public function Node(size:int, following:Node = null)
		{
			this.size = size;
			this.following = following;
			this.point = [x, y];
			this.friction = 1;
			speed = [0, 0];
			draw();
		}
		
		public function tick():void
		{
			if (following != null)
			{
				moveTowards(following.getPoint(), AdvMath.distance(this.getPoint(), following.getPoint()) - 10);
			}
			for (var i:int = 0; i < speed.length; i++)
				speed[i] *= friction;
			move(speed);
		}
		
		public function draw():void
		{
			graphics.clear();
			graphics.beginFill(0xFF / size);
			graphics.drawCircle(0, 0, size);
		}
		
		public function moveTowards(target:Array, speed:Number):void
		{
			this.speed = AdvMath.moveAtTarget([x, y], target, speed);
		}
		
		public function setSpeed(speed:Array):void
		{
			this.speed = speed;
		}
		
		public function move(speed:Array):void
		{
			x += speed[0];
			y += speed[1];
		}
		
		public function getPoint():Array
		{
			return point;
		}
	}
}