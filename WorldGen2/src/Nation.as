package  
{
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Nation 
	{
		private var num:int;
		private var main:Main;
		private var color:int;
		private var tiles:Vector.<Tile>
		
		public function Nation(main:Main, num:int, color:int ) 
		{
			setColor(color);
			setMain(main);
			setNum(num);
			setTiles(new Vector.<Tile>);
		}
		
		private function setTiles(tiles:Vector.<Tile>):void 
		{
			this.tiles = tiles;
		}
		
		private function setColor(color:int):void 
		{
			this.color = color;
		}
		
		private function getMain():Main
		{
			return main;
		}
		
		private function setMain(main:Main):void 
		{
			this.main = main;
		}
		
		private function setNum(num:int):void 
		{
			this.num = num;
		}
		
		public function getNum():int
		{
			return this.num;
		}
		
		public function getColor():int 
		{
			return color;
		}
		
		public function addTile(tile:Tile):void 
		{
			this.tiles.push(tile);
		}
		
	}

}