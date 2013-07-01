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
		public static var i:Main;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			i = this;
			var player:Entity = new Entity("player"), monster:Entity = new Entity("monster");
			player.setStat("health", 25);
			var b:Battle = new Battle([player, monster]);
			b.start();
		}
	}
}