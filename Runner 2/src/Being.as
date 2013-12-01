package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Being extends Sprite
	{
		private var main:Main;
		private var image:Sprite;
		private var size:int;
		
		public function Being(main:Main, x:int, y:int, size:int)
		{
			this.size = size;
			
			this.y = y;
			this.x = x;
			this.main = main;
			this.image = new Sprite;
			addChild(image);
			image.graphics.lineStyle(1);
			image.graphics.drawRect(0, 0, size, size);
		}
	}
}