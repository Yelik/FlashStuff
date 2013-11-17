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
		private var units:Vector.<Unit>;
		
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
			units = new Vector.<Unit>
			
			for (var i:int = 0; i < 10; i++)
			{
				tiles.push(new Tile(this, i));
				addChild(tiles[i]);
				tiles[i].x = i * getTileSize();
				tiles[i].y = 100;
			}
			
			var spawn:Building = new Building(tiles[tiles.length / 2]);
			addEventListener(Event.ENTER_FRAME, tick);
		}
		
		private function tick(e:Event = null):void
		{
			for each (var tile:Tile in tiles)
			{
				tile.tick();
			}
			for each (var unit:Unit in units)
			{
				unit.tick();
			}
		}
		
		public function sgetUnits(units:Vector.<Unit> = null):Vector.<Unit>
		{
			if (units != null)
			{
				this.units = units
			}
			return this.units;
		}
		
		public function addUnit(unit:Unit):void
		{
			units.push(unit);
			addChild(unit);
			unit.y = 60;
		}
		
		public function getTileSize():int
		{
			return 40;
		}
	}
}