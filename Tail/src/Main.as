package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var i:Main;
		
		public function Main():void
		{
			i = this;
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new FPSCounter(0, 0, 0));
			var ent:Entity = new Entity(5);
			addChild(ent);
		}
	}
}