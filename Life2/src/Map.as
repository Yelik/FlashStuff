package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map
	{
		public var width:int, height:int, maxLife:int, tileWidth:int, tileHeight:int, map:Vector.<Tile>, color:int;
		
		public function Map(width:int, height:int, maxLife:int)
		{
			this.width = width;
			this.height = height;
			this.maxLife = maxLife;
			this.tileWidth = Main.i.stage.stageWidth / width;
			this.tileHeight = Main.i.stage.stageHeight / height;
			this.color = 0x5500FF;
			
			this.map = new Vector.<Tile>;
			
			for (var x:int = 0; x < width; x++)
			{
				for (var y:int = 0; y < height; y++)
				{
					map.push(Main.i.addChild(new Tile(x, y, this)));
				}
			}
			
			for each (var t:Tile in map)
			{
				t.initialScan();
			}
		}
		
		public function shift():void
		{
			scan();
			grow();
		}
		
		private function scan():void
		{
			for each (var t:Tile in map)
			{
				t.scan();
			}
		}
		
		private function grow():void
		{
			for each (var t:Tile in map)
			{
				t.grow();
			}
		}
	}
}