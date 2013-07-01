package
{
	import com.mrizen.countrygen.*;
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
			
			map = Generator.genMap(10, 10, null, 0, 5, 0, 5);
			map.render();
			trace();
		}
	}
}


