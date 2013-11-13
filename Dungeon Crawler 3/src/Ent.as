package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Ent extends Image
	{
		private var tile:Tile;
		
		public function Ent(tile:Tile)
		{
			setTile(tile);
		}
		
		private function setTile(tile:Tile):void 
		{
			this.tile = tile;
		}
		
		override public function drawImage():Sprite 
		{
			return getMain().draw(getMain().idPlayer);
		}
		
		private function getMain():Main
		{
			return getTile().getMap().getGame().getMain();
		}
		
		private function getTileSize():uint 
		{
			return getTile().getTileSize();
		}
		
		private function getTile():Tile
		{
			return tile;
		}
	}
}