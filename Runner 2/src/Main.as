package
{
	import adobe.utils.ProductManager;
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
			
			cb(0, 400, 1000, 50);
			
			player = new Player(this, 200, 200);
			addChild(player);
		}
		
		protected function cb(x:int, y:int, width:int, height:int):void
		{
			new Block(this, x, y, width, height);
		}
	
	}

}