package
{
	import com.mrizen.minotaur.FlowControl;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class Main extends Sprite
	{
		private var flowControl:FlowControl;
		
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
			flowControl = new FlowControl(this);
		}
	
	}

}