package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Map extends Image
	{
		private var map:Vector.<Tile>
		private var game:Game;
		private var tileSize:uint;
		private var mapSize:Array;
		
		public function Map(game:Game, tileSize:int, mapSize:Array)
		{
			setGame(game);
			setTileSize(tileSize);
			setMapSize(mapSize);
		}
		
		private function setMapSize(mapSize:Array):void
		{
			this.mapSize = mapSize;
			map = new Vector.<Tile>
			for (var y:int = 0; y < mapSize[1]; y++)
			{
				for (var x:int = 0; x < mapSize[0]; x++)
				{
					map.push(new Tile(this, [x, y]));
				}
			}
		}
		
		private function setGame(game:Game):void
		{
			this.game = game;
		}
		
		override public function drawImage():Sprite
		{
			var image:Sprite = super.drawImage();
			for each (var tile:Tile in map)
			{
				tile.setImage();
				image.addChild(tile.getImage());
			}
			return image;
		}
		
		public function getTileSize():uint
		{
			return tileSize;
		}
		
		public function setTileSize(tileSize:uint):void
		{
			this.tileSize = tileSize;
		}
		
		public function genMap(seed:int):void
		{
			for (var y:int = 0; y < getHeight(); y++)
			{
				for (var x:int = 0; x < getWidth(); x++)
				{
					setTileTypeAt([x, y], x);
				}
			}
		}
		
		public function getTileTypeAt(local:Array):int
		{
			return getTileAt(local).getType();
		}
		
		private function setTileTypeAt(local:Array, type:int):void
		{
			getTileAt(local).setType(type);
		}
		
		private function getTileAt(local:Array):Tile
		{
			return map[local[1] * getWidth() + local[0]];
		}
		
		private function getWidth():int
		{
			return getMapSize()[0]
		}
		
		private function getHeight():int
		{
			return getMapSize()[1]
		}
		
		private function getMapSize():Array
		{
			return mapSize;
		}
		
		public function getGame():Game
		{
			return game;
		}
	}
}