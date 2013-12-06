package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Block extends Shape
	{
		public var mapY:Number;
		public var mapX:Number;
		protected var main:Main;
		
		public function Block(main:Main, x:int, y:int, width:int, height:int)
		{
			this.main = main;
			this.mapX = x;
			this.mapY = y;
			graphics.lineStyle(1);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, width, height);
			main.blocks.push(this);
			main.addChild(this);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			this.x = mapX - main.player.mapX;
			this.y = mapY - main.player.mapY;
		}
	}
}