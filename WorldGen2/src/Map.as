package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Map
	{
		private var map:Vector.<Tile>
		private var mapSize:Array;
		private var main:Main;
		
		public function Map(main:Main, map:Vector.<Tile> = null, width:int = 0)
		{
			setMain(main);
			;
			if (map != null && width != 0)
			{
				setMap(map);
				setMapSize(width, map.length / width);
			}
		}
		
		private function setMain(main:Main):void
		{
			this.main = main;
		}
		
		private function setMapSize(width:int, height:int):void
		{
			mapSize = [width, height];
		}
		
		private function setMap(map:Vector.<Tile>):void
		{
			this.map = map;
		}
		
		public function getImage():Sprite
		{
			var image:Sprite = new Sprite();
			image.x = getMain().getMapBufferLeft();
			image.y = getMain().getMapBufferTop();
			for (var x:int = 0; x < getWidth(); x++)
			{
				for (var y:int = 0; y < getHeight(); y++)
				{
					var tileImage:Sprite = getAt(x, y).getImage()
					tileImage.x = getTileWidth() * x;
					tileImage.y = getTileHeight() * y;
					image.addChild(tileImage);
				}
			}
			return image;
		}
		
		public function getTileHeight(buffer:Boolean = true):int
		{
			if (buffer)
				return getMapHeight() / (getWidth() + getMain().getTileBuffer());
			else
				return getMapHeight() / getWidth();
		}
		
		private function getMapHeight():int
		{
			return getMain().getStageHeight() - getMain().getMapBufferTop() - getMain().getMapBufferBot();
		}
		
		public function getTileWidth(buffer:Boolean = true):int
		{
			
			if (buffer)
				return getMapWidth() / (getWidth() + getMain().getTileBuffer());
			else
				return getMapWidth() / getWidth();
		}
		
		private function getMapWidth():int
		{
			return getMain().getStageWidth() - getMain().getMapBufferLeft() - getMain().getMapBufferRight();
		}
		
		public function genMap(width:int, height:int):void
		{
			var map:Vector.<Tile> = new Vector.<Tile>;
			setMapSize(width, height);
			for (var x:int = 0; x < width; x++)
			{
				for (var y:int = 0; y < height; y++)
				{
					var tile:Tile = new Tile(this, x, y);
					map.push(tile);
					
					if (x % y + y % x == 0)
						tile.setLand(false);
					
					if (y % 2 == 0)
						tile.setNation(0);
					else
						tile.setNation(1);
					
					if (x == 0 || x == width - 1 || y == 0 || y == height - 1)
						tile.setLand(false);
				}
			}
			this.map = map;
		}
		
		public function getMain():Main
		{
			return this.main;
		}
		
		private function getAt(x:int, y:int, map:Vector.<Tile> = null, width:int = 0):Tile
		{
			if (map == null || width == 0)
			{
				map = getMap();
				width = getWidth();
			}
			return map[y * width + x];
		}
		
		private function getMap():Vector.<Tile>
		{
			return map;
		}
		
		private function getWidth():int
		{
			return getMapSize()[0];
		}
		
		private function getHeight():int
		{
			return getMapSize()[1];
		}
		
		private function getMapSize():Array
		{
			return mapSize;
		}
	}
}