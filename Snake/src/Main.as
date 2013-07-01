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
		private var level1:Level;
		
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
			level1 = new Level();
			level1.start();
		}
	}
}