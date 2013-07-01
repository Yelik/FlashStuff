package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var i:Main, world:World;
		
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
			addChild(AdvMath.drawJaggedLine([10, 10], [500, 500], 3, 10, new Sprite));
			//i = this;
			//addChild(new FPSCounter(0, 0, 0));
			//Tile.prepTypes();
			
			//start();
		}
		
		static private function tick(e:KeyboardEvent):void
		{
			world.tick();
		
		}
		
		public static function start():void
		{
			world = new World(10, 10);
			world.generateTiles();
			world.addToStage();
			
			i.stage.addEventListener(KeyboardEvent.KEY_DOWN, tick);
		}
		
		public static function stop():void
		{
			world.removeFromStage();
			pause();
		}
		
		public static function pause():void
		{
			i.removeEventListener(Event.ENTER_FRAME, tick);
		}
	}
}