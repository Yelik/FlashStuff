package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		public var player:Player;
		public var blocks:Vector.<Block>
		public var debug:Boolean;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			debug = false;
			
			addChild(new FPSCounter(0, 0, 0x0));
			
			blocks = new Vector.<Block>
			
			cb(0, -1000, 50, 1000);
			cb(50, 550, 700, 50);
			cb(0, 0, 50, 600);
			cb(750, 0, 50, 600);
			cb(750, -1000, 50, 1000);
			cb(50, -1000, 700, 50);
			
			cb(100, 350, 25, 25, 2);
			cb(400, 300, 25, 25, 2);
			cb(400, 100, 25, 25, 2);
			cb(200, 0, 25, 25, 2);
			cb(100, -200, 25, 25, 0, 2);
			
			player = new Player(this, 200, 200);
			addChild(player);
		}
		
		protected function cb(x:int, y:int, width:int, height:int, xSpeed:int = 0, ySpeed:int = 0):void
		{
			new Block(this, x, y, width, height, xSpeed, ySpeed);
		}
	
	}

}