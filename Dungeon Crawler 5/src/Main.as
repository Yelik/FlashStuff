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
			
			var p1:Player = new Player("Player 1", 10, 2, 1, 1);
			var p2:Player = new Player("Player 2", 10, 2, 1, 1);
			var fight:Fight = new Fight(this, p1, p2);
			addChild(fight);
		}
	}
}