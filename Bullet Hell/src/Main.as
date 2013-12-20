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
			
			Mouse.hide();
			frameNumber = 0;
			bullets = new Vector.<Bullet>
			
			player = new Player(this, 100, 500, 4, 5);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			if (Math.floor(Math.random() * 10) == 0)
				new Bullet(this, mouseX, 0, 0, 5, 4, 16);
		}
	
	}

}