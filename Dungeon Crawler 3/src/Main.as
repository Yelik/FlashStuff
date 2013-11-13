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
		private var id:int;
		public var idPlayer:int;
		
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
			
			id = 0;
			
			actGame = new Game(this);
			actGame.setMap(new Map(actGame, 10, [10, 10]));
			actGame.getMap().genMap(0);
			actGame.load();
		}
		
		private function loadGame(game:Game):void
		{
			actGame.unload();
			actGame = game;
			actGame.load();
		}
		
		private function nextId():int
		{
			id++;
			return id;
		}
		
		public function draw(id:int):Sprite
		{
			var image:Sprite = new Sprite;
			
			if (id == idPlayer)
			{
				image.graphics.lineStyle(1, 0);
				image.graphics.moveTo(getTileSize() * 0.2, getTileSize() * 0.8);
				image.graphics.lineTo(getTileSize() * 0.5, getTileSize() * 0.5);
				image.graphics.lineTo(getTileSize() * 0.8, getTileSize() * 0.8);
			}
			
			return image;
		}
		
		private function getTileSize():int
		{
			return actGame.getMap().getTileSize();
		}
	}
}