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
			
			blocks = new Vector.<Block>
			new Block(this, 50, 500, 200, 25);
			new Block(this, 350, 400, 200, 25);
			new Block(this, 600, 300, 100, 25);
			new Block(this, 700, 200, 100, 25);
			new Block(this, 50, 300, 100, 25);
			
			player = new Player(this, 0, 0);
			addChild(player);
		}
	
	}

}