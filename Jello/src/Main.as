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
		public static var i:Main, entities:Array;
		
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
			//
//FIGHTING	entities = [new Entity(200, 500, 100, 10 0, 5, 0x00FF00), new Entity(400, 500, 100, 100, 5, 0x0000FF)];
//SWIMMING	entities = [new Entity(600, 500, 200, 100, 10, 0xFF0000), new Entity(200, 500, 100, 100, 10, 0x00FF00), new Entity(400, 500, 100, 100, 10, 0x0000FF)];
			entities = [new Entity(stage.stageWidth / 2, stage.stageHeight / 2, 100, 1000, 10, 0x0000FF), new Entity(stage.stageWidth / 2, stage.stageHeight, 100, 1000, 10, 0xFF0000), new Entity(stage.stageWidth / 2, stage.stageHeight, 100, 1000, 10, 0x00FF00)];
			for each (var entity:Entity in entities)
				addChild(entity);
		}
	}
}