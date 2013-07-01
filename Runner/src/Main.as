package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		private var player:Being;
		public var metaBlock:Vector.<flash.display.Shape>;
		
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
			
			metaBlock = new Vector.<Shape>;
			metaBlock.push(new Block(50, 500, 200, 25));
			metaBlock.push(new Block(350, 400, 200, 25));
			metaBlock.push(new Block(600, 300, 100, 25));
			metaBlock.push(new Block(700, 200, 100, 25));
			metaBlock.push(new Block(50, 300, 100, 25));
			
			for each (var s:Shape in metaBlock)
			{
				addChild(s);
			}
			
			player = new Being(this, 100, 400);
		}
	}
}