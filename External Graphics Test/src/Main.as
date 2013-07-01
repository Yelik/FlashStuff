package
{
	import flash.display.*;
	import flash.events.*;

	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends MovieClip
	{
		public static var i:Main;
		
		public function Main():void
		{
			i = this;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			new MediaLoader();
		}
		
		public function doneLoading():void
		{
			//Entry Point
		}
	}
}
