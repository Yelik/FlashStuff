package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Dot extends Sprite
	{
		private var connections:Vector.<Dot>;
		private var main:Main;
		private var mapX:int;
		private var mapY:int;
		private var size:int;
		
		public function Dot(main:Main, x:int, y:int, size:int, mapX:int, mapY:int)
		{
			this.size = size;
			this.mapY = mapY;
			this.mapX = mapX;
			this.main = main;
			this.y = y;
			this.x = x;
		}
		
		public function findConnections():void
		{
			connections = new Vector.<Dot>
			for each (var connect:Dot in main.dots)
			{
				if (connect.getX() == getX() - 1 && connect.getY() == getY())
				{
					connections.push(connect);
				}
				else if (connect.getX() == getX() + 1 && connect.getY() == getY())
				{
					connections.push(connect);
				}
				else if (connect.getX() == getX() && connect.getY() == getY() - 1)
				{
					connections.push(connect);
				}
				else if (connect.getX() == getX() && connect.getY() == getY() + 1)
				{
					connections.push(connect);
				}
			}
		}
		
		public function draw():void
		{
			graphics.lineStyle(size);
			for each (var connect:Dot in connections)
			{
				graphics.moveTo(0, 0);
				graphics.lineTo(connect.x - x, connect.y - y);
			}
		}
		
		public function getY():int
		{
			return mapY;
		}
		
		public function getX():int
		{
			return mapX;
		}
	}
}