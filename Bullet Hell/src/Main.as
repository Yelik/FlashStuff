package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var frameNumber:int;
		public var player:Player;
		public var bullets:Vector.<Bullet>;
		private var i:int = 0;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(new FPSCounter(0, 0, 0));
			Mouse.hide();
			frameNumber = 0;
			bullets = new Vector.<Bullet>
			
			player = new Player(this, 100, 500, 4, 5);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			i++
			if (i % 10 == 0)
			{
				for (var i:int = 0; i < this.i / 100; i++)
				{
					new Bullet(this, mouseX, 0, Math.random() * 2 - 1, Math.random() * 10, 4, 16);
				}
			}
		}
	}
}