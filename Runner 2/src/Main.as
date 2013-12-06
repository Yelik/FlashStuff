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
		
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			blocks = new Vector.<Block>
			new Block(this, 50, 550, 700, 50);
			new Block(this, 0, 0, 50, 600);
			new Block(this, 750, 0, 50, 600);
			new Block(this, 50, 0, 700, 50);
			new Block(this, 100, 450, 50, 50);
			new Block(this, 100, 350, 50, 50);
			new Block(this, 100, 250, 50, 50);
			new Block(this, 100, 150, 50, 50);
			
			player = new Player(this, 200, 200);
			addChild(player);
		}
	
	}

}