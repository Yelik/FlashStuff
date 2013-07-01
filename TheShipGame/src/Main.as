package 
{
	import com.mrizen.ship1.FlowControl;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class Main extends Sprite 
	{
		private var ship:FlowControl;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			ship = new FlowControl(this);
		}
		
	}
	
}