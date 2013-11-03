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
		public static var I:Main;
		
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
			I = this;
			Node.makeTypes();
			var node:Node = new Node(400, 300, null, Node.TYPE_SEED);
			node.addNode(-0, -100, Node.TYPE_FORK);
		}
	}
}