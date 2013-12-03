package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Block extends Shape
	{
		protected var main:Main;
		
		public function Block(main:Main, x:int, y:int, width:int, height:int)
		{
			this.main = main;
			this.y = y;
			this.x = x;
			graphics.lineStyle(1);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, width, height);
			main.blocks.push(this);
			main.addChild(this);
		}
	}
}