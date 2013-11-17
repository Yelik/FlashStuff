package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Building extends Sprite
	{
		private var tile:Tile;
		
		public function Building(tile:Tile)
		{
			sgetTile(tile);
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0x0000FF);
			this.graphics.drawRect(tile.width / 4, tile.height / 4, tile.width / 2, tile.height / 2);
		}
		
		public function sgetTile(tile:Tile = null):Tile
		{
			if (tile != null)
			{
				this.tile = tile;
				tile.addChild(this);
			}
			return this.tile;
		}
		
		public function tick():void
		{
			if (getMain().sgetUnits().length < 1)
			{
				getMain().addUnit(new Unit(getMain(), tile.getPos()));
			}
		}
		
		private function getMain():Main
		{
			return sgetTile().sgetMain();
		}
	}
}