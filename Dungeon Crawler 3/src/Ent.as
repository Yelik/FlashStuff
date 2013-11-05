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
			var image:Sprite = super.drawImage();
			image.graphics.lineStyle(1);
			image.graphics.drawCircle(0, 0, getTileSize());
			return image;
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