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
		private var m:Map;
		
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
			m = new Map(this, 10);
			addChild(m);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			regen();
		}
		
		private function keyDownListener(e:KeyboardEvent = null):void
		{
			regen();
		}
		
		private function regen():void
		{
			m.clear();
			m.generate(1, 500);
		}
	}
}