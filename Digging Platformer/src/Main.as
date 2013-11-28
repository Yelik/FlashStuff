package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var map:Array
		
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
			
			var width:int = 10;
			var height:int = 10;
			
			map = new Array
			
			for (var x:int = 0; x < width; x++)
			{
				for (var y:int = 0; y < height; y++)
				{
					map.push(1);
				}
			}
		}
	
	}

}