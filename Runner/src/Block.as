package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Block extends Shape
	{
		
		public function Block(x:int, y:int, width:int, height:int)
		{
			this.y = y;
			this.x = x;
			graphics.lineStyle(1);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, width, height);
		}
	}
}