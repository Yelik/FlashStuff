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
		static public var i:Main;
		private var map:Map;
		
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
			map = new Map(100, 100, 7);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
		}
		
		private function stage_keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				map.shift();
			}
		}
	}
}