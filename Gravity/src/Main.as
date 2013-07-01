package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var rocks:Array = [], i:Main;
		
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
			addEventListener(Event.ENTER_FRAME, frame);
			i = this;
			addRock(new Point(100, 50), 10);
		}
		
		private function addRock(location:Point, size:Number):void
		{
			rocks.push(new Rock(location, size));
		}
		
		private function removeRock(rock:Rock):void
		{
			rocks.slice(rocks.indexOf(rock), 1);
		}
		
		private function frame(e:Event):void
		{
			for each (var r:Rock in rocks)
			{
				r.render();
			}
		}
	}
}