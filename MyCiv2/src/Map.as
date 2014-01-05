package
{
	import flash.accessibility.Accessibility;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Map
	{
		private var size:int;
		private var map:Vector.<Tile>
		
		public function Map(size:int)
		{
			this.size = size;
			map = new Vector.<Tile>;
			for (var i:int = 0; i < size * size; i++)
			{
				var x:int = i % size;
				var y:int = Math.floor(i / size % size);
				if (x == getCenter()[0] && y == getCenter()[1])
				{
					map.push(new City(this, x, y, 1, 0, 1));
				}
				else
				{
					map.push(new Tile(this, x, y, getRandomForest(), Tile.FLAT, 1.01));
				}
			}
		}
		
		public function getCenter():Array
		{
			return [Math.floor(size / 2), Math.floor(size / 2)];
		}
		
		private function getRandomForest():int
		{
			return Math.ceil(Math.random() * 4) * 250;
		}
		
		public function getAt(loc:Array):Tile
		{
			return map[loc[1] * size + loc[0]];
		}
		
		public function getSize():int
		{
			return size;
		}
		
		public function turn():void
		{
			for each (var t:Tile in map)
			{
				t.turn();
			}
		}
	}

}