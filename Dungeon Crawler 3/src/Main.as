package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var actGame:Game
		
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
			actGame = new Game(this);
			actGame.setMap(new Map(actGame, 10, [10, 10]));
			actGame.getMap().genMap(0);
			actGame.load();
			trace(actGame.getMap().getTileTypeAt([2, 3]));
		}
		
		private function loadGame(game:Game):void
		{
			actGame.unload();
			actGame = game;
			actGame.load();
		}
	}
}