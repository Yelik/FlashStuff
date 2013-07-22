package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Tile extends Sprite
	{
		private var life:int;
		private var mapX:int, mapY:int, color:int, map:Map, aoeLife:int, neighbors:Vector.<Tile>;
		
		public function Tile(x:int, y:int, map:Map)
		{
			this.mapX = x;
			this.mapY = y;
			this.map = map;
			
			this.color = 0;
			this.life = 0;
			
			if (mapX == 0 || mapX == map.width - 1) {
			   life = map.maxLife;					//V 2, 4
			}
			 
			//life = mapX / map.maxLife; 			
			
			/*if (mapX == 50 && mapY % 5 == 0)
			{
				life = map.maxLife;
			}*/
			
			neighbors = new Vector.<Tile>;
			
			updateColor();
		}
		
		public function scan():void
		{
			aoeLife = 0;
			for each (var n:Tile in neighbors)
			{
				aoeLife += n.life;
			}
		}
		
		public function grow():void
		{
			//life = aoeLife % map.maxLife + 1; V1
			/*if (aoeLife > map.maxLife * 6 || aoeLife < map.maxLife * 2)
			   {
			   life--;
			   }
			   else if (aoeLife < map.maxLife * 6 || aoeLife > map.maxLife * 2)   v2 - 4
			   {
			   life++;
			 }*/
			
			if (aoeLife > map.maxLife * 6 || aoeLife < map.maxLife * 2)
			{
				life--;
			}
			else if (aoeLife < map.maxLife * 6 || aoeLife > map.maxLife * 2)
			{
				life++;
			}
			
			if (life < 0)
			{
				life = 0;
			}
			else if (life > map.maxLife)
			{
				life = map.maxLife;
			}
			updateColor();
		}
		
		public function initialScan():void
		{
			for (var x2:int = -1; x2 <= 1; x2++)
			{
				for (var y2:int = -1; y2 <= 1; y2++)
				{
					if ((mapY + y2) < 0 || (mapX + x2) < 0 || (mapY + y2) > map.height - 1 || (mapX + x2) > map.width - 1 || (y2 == 0 && x2 == 0)) //|| (y2 == 0 && x2 == 0) v 4
					{
						continue;
					}
					neighbors.push(map.map[(mapY + y2) * map.width + (mapX + x2)])
				}
			}
		}
		
		public function updateColor():void
		{
			color = map.color * life / map.maxLife;
			redraw();
		}
		
		private function redraw():void
		{
			var g:Graphics = graphics;
			g.clear();
			g.beginFill(color);
			g.drawRect(findX(), findY(), map.tileWidth, map.tileHeight);
		}
		
		private function findX():int
		{
			return mapX * map.tileWidth;
		}
		
		private function findY():int
		{
			return mapY * map.tileHeight;
		}
	}
}