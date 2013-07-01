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
			m = new Map(stage.stageWidth, stage.stageHeight);
			m.generate();
			addChild(m);
			addEventListener(Event.ENTER_FRAME, frame);
		}
		
		private function frame(e:Event = null):void
		{
			m.next();
		}
	}
}