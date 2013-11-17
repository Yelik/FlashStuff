package
{
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Resource
	{
		private var tile:Tile;
		
		public function Resource(tile:Tile)
		{
			sgetTile(tile);
		}
		
		public function sgetTile(tile:Tile = null):Tile
		{
			if (tile != null)
			{
				this.tile = tile;
			}
			return this.tile;
		}
	}
}