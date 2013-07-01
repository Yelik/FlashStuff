package
{
	import flash.display.Sprite;
	import flash.errors.EOFError;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity extends Sprite
	{
		private var tiles:Vector.<Tile>, game:Game, color:int, power:Number, regenRate:Number;
		
		public function Entity(game:Game)
		{
			this.game = game;
			game.addEntity(this);
			tiles = new Vector.<Tile>;
			color = getUniqueColor();
			regenRate = 0.25;
			power = 1;
		}
		
		public function turn():void
		{
			if (this.tiles.length == 0)
				return;
			power += regenRate * getStrength();
			var tiles:Vector.<Tile>, tiles2:Vector.<Tile>;
			while (power >= 1)
			{
				power--;
				tiles = new Vector.<Tile>;
				for each (var tile:Tile in this.tiles)
				{
					tiles2 = tile.getNeighbors();
					for each (var tile2:Tile in tiles2)
						tiles.push(tile2);
				}
				for (var i:int = 0; i < tiles.length; i++)
				{
					var index:int = Math.floor(Math.random() * tiles.length);
					tile = tiles[index];
					if (tiles.indexOf(tile) != tiles.lastIndexOf(tile))
					{
						tiles.splice(index, 1);
						continue;
					}
					if (tile.getEntity() == this)
					{
						tiles.splice(index, 1);
						continue;
					}
					addTile(tile);
					break;
				}
			}
		}
		
		public function addTile(tile:Tile):void
		{
			tiles.push(tile);
			tile.setEntity(this);
		}
		
		public function removeTile(tile:Tile):void
		{
			tiles.splice(tiles.indexOf(tile), 1);
			tile.setEntity(null);
		}
		
		public function getColor():int
		{
			return color;
		}
		
		public function getStrength():int
		{
			return tiles.length;
		}
		
		private static function getUniqueColor():int
		{
			return 0xFFFFFF * Math.random();
		}
	}
}