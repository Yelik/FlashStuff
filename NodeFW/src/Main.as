package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.mrizen.nodeFW.FlowControl;

	/**
	 * ...
	 * @author yelik
	 */
	public class Main extends Sprite 
	{
		private var life:FlowControl

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			life = new FlowControl(this, 50, 50);
		}

	}

}