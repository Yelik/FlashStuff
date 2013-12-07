package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Wall extends Sprite
	{
		public var main:Main;
		public var mapY:int;
		public var mapX:int;
		
		public function Wall(main:Main, x:int, y:int, width:int, height:int)
		{
			this.main = main;
			this.mapY = y;
			this.mapX = x;
			graphics.lineStyle(1);
			graphics.drawRect(0, 0, width, height);
			addEventListener(Event.ENTER_FRAME, enterFrame);
			main.addChild(this);
			main.walls.push(this);
			enterFrame();
		}
		
		private function enterFrame(e:Event = null):void
		{
			this.x = mapX - main.player.x + main.stage.stageWidth / 2;
			this.y = mapY - main.player.y + main.stage.stageHeight / 2;
		}
	}
}