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

		public function Main():void
		{
			
		}

		private function init(e:Event = null):void
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
			
			if (parent != stage)
			{
				return;
			}
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
}
