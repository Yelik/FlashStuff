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
			
			player = new Player(this, 100, 100);
			
			new Wall(this, 0, 0, 50, 50);
			new Wall(this, 50, 0, 50, 50);
			new Wall(this, 100, 0, 50, 50);
			new Wall(this, 150, 0, 50, 50);
		}
	}
}