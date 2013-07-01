package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class TwoDArray
	{
		private var array:Array, width:int, height:int;
		
		public function TwoDArray(width:int, height:int)
		{
			array = new Array(width * height);
			this.width = width;
			this.height = height;
		}
		
		public function getAt(x:int, y:int):*
		{
			while (x > width - 1)
				x -= width;
			while (x < 0)
				x += width;
			while (y > height - 1)
				y -= height;
			while (y < 0)
				y += height;
			return array[y * width + x];
		}
		
		public function setAt(x:int, y:int, value:*):void
		{
			while (x > width - 1)
				x -= width;
			while (x < 0)
				x += width;
			while (y > height - 1)
				y -= height;
			while (y < 0)
				y += height;
			array[y * width + x] = value;
		}
		
		public function getAll():Array
		{
			return array;
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