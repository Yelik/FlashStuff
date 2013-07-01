package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var tree:Tree = new Tree();
			tree.x = stage.stageWidth / 2;
			tree.y = stage.stageHeight / 2;
			addChild(tree);
		}
	}
}