package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class D2List
	{
		private var list:Vector.<Vector.<Tile>>, game:Game, width:int, height:int;
		
		public function D2List(game:Game, width:int, height:int)
		{
			this.height = height;
			this.width = width;
			this.game = game;
			list = new Vector.<Vector.<Tile>>();
			for (var x:int = 0; x < width; x++)
			{
				list.push(new Vector.<Tile>());
				for (var y:int = 0; y < height; y++)
				{
					list[x].push(new Tile(game, x, y));
				}
			}
		}
		
		public function getTile(x:int, y:int):Tile
		{
			if (x < 0)
			{
				x += width;
			}
			else if (x >= width)
			{
				x -= width;
			}
			if (y < 0)
			{
				y += height;
			}
			else if (y >= height)
			{
				y -= height;
			}
			return list[x][y];
		}
	}
}