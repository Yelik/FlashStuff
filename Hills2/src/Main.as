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
		private var fps:FPSCounter, world:World, gen:WorldGenerator;
		
		public static var i:Main;
		
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
			
			i = this;
			addChild(fps = new FPSCounter());
			
			world = new World();
			addChild(world);
			
			gen = world.getGen();
			gen.generate();
			
			world.draw();
		}
	}
}