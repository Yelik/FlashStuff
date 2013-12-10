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
			
			blocks = new Vector.<Block>
			cb(50, 550, 700, 50);
			cb(0, 0, 50, 600);
			cb(750, 0, 50, 600);
			cb(50, 0, 700, 50);
			cb(100, 350, 25, 25);
			cb(400, 300, 25, 25);
			cb(400, 100, 25, 25);
			
			player = new Player(this, 200, 200);
			addChild(player);
		}
		
		protected function cb(x:int, y:int, width:int, height:int):void
		{
			new Block(this, x, y, width, height);
		}
	
	}

}