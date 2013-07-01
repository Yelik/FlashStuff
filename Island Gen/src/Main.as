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
		private var map:Map;
		
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
			map = new Map(600, 600, true);
			map.addRandomIslands(10, 600);
			map.mergeIslands();
		}
	}
}