package
{
	
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
				map.push(new Tile(i % size, Math.floor(i / size % size), 1000, 0));
			}
		}
		
		public function getAt(x:int, y:int):Tile
		{
			return map[y * size + x];
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