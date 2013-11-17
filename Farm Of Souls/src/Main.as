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
		private var tiles:Vector.<Tile>
		
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
			
			tiles = new Vector.<Tile>
			for (var i:int = 0; i < 10; i++) 
			{
				tiles.push(new Tile(this, i));
				addChild(tiles[i]);
				tiles[i].x = i * tiles[i].width;
			}
			
		}
	}
}