package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var i:Main;
		
		public var game:Game;
		
		public function Main()
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
			i = this;
			game = new Game();
			game.start();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				game.turn();
			}
			else if (e.keyCode == Keyboard.ENTER)
			{
				game.stop();
				game = new Game();
				game.start();
			}
		}
	}
}