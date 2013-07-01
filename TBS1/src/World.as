package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class World
	{
		private var tiles:TwoDArray, image:Sprite, onStage:Boolean;
		
		public function World(width:uint, height:uint)
		{
			tiles = new TwoDArray(width, height);
			image = new Sprite();
			image.x = 25;
			image.y = 25;
			onStage = false;
		}
		
		public function tick():void
		{
			for each (var t:Tile in tiles.getAll())
				t.tick();
		}
		
		public function generateTiles():void
		{
			for (var x:int = 0; x < tiles.getWidth(); x++)
			{
				for (var y:int = 0; y < tiles.getHeight(); y++)
				{
					tiles.setAt(x, y, new Tile(this, x, y, AdvMath.randChoice([Tile.FLAT, Tile.FLAT, Tile.BLANK])));
				}
			}
			
			x = Math.floor(Math.random() * tiles.getWidth());
			y = Math.floor(Math.random() * tiles.getHeight());
			while (tiles.getAt(x, y).getType() != Tile.FLAT)
			{
				x = Math.floor(Math.random() * tiles.getWidth());
				y = Math.floor(Math.random() * tiles.getHeight());
			}
			
			Tile(tiles.getAt(x, y)).setPop(1);
		}
		
		public function addToStage():void
		{
			if (!onStage)
			{
				for each (var t:Tile in tiles.getAll())
					image.addChild(t.getImage());
				
				Main.i.addChild(image);
				onStage = true;
			}
		}
		
		public function removeFromStage():void
		{
			if (onStage)
			{
				for each (var t:Tile in tiles.getAll())
					image.removeChild(t.getImage());
				
				Main.i.removeChild(image);
				onStage = false;
			}
		}
		
		public function getTiles():TwoDArray
		{
			return tiles;
		}
	}
}