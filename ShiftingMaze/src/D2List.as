package
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class D2List
	{
		private var list:Vector.<Vector.<int>>, width:int, height:int;
		
		public function D2List(width:int, height:int)
		{
			this.height = height;
			this.width = width;
			list = new Vector.<Vector.<int>>();
			for (var x:int = 0; x < width; x++)
			{
				list.push(new Vector.<int>());
				for (var y:int = 0; y < height; y++)
				{
					list[x].push(0);
				}
			}
		}
		
		public function getAt(x:int, y:int):int
		{
			if (x < 0)
			{
				x += width;
			}
			else if (x >= width)
			{
				x -= width;
			}
			if (y < 0)
			{
				y += height;
			}
			else if (y >= height)
			{
				y -= height;
			}
			return list[x][y];
		}
		
		public function getAtP(p:Point):int
		{
			return getAt(p.x, p.y);
		}
		
		public function setAt(x:int, y:int, value:int):void
		{
			if (x < 0)
			{
				x += width;
			}
			else if (x >= width)
			{
				x -= width;
			}
			if (y < 0)
			{
				y += height;
			}
			else if (y >= height)
			{
				y -= height;
			}
			list[x][y] = value;
		}
		
		public function setAll(value:Vector.<Vector.<int>>):void
		{
			list = value;
		}
		
		public function traceAll():void
		{
			for each (var v:Vector.<int>in list)
			{
				trace(v);
			}
		}
		
		public function getWidth():int
		{
			return width;
		}
		
		public function getHeight():int
		{
			return height;
		}
	}
}