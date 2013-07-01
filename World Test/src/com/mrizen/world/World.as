package com.mrizen.world
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class World
	{
		private var worldMap:Array;
		private var onStage:Boolean;
		
		public function World(xSize:uint, ySize:uint)
		{
			worldMap = generate(xSize, ySize);
		}
		
		public function generate(xSize:uint, ySize:uint):Array
		{
			var heightmap:Array = generateHeightmap(xSize, ySize);
			var map:Array = [];
			var mapY:Array;
			var x:uint = 0;
			var y:uint = 0;
			
			while (x < xSize)
			{
				mapY = new Array();
				while (y < ySize)
				{
					mapY.push(new Tile(this, x, y, getTypeByHeight(x, y, heightmap)));
					y++;
				}
				map.push(mapY);
				x++;
				y = 0;
			}
			
			return map;
		}
		
		private function generateHeightmap(xSize:uint, ySize:uint):Array
		{
			var map:Array = [[0]];
			var mapX:Array = [];
			var mapY:Array = [];
			var xSizeCur:uint = xSize;
			var ySizeCur:uint = ySize;
			var start:uint;
			
			while (xSize / xSizeCur < xSize && ySize / ySizeCur < ySize)
			{
				xSizeCur /= 2;
				ySizeCur /= 2;
				while (mapX.length < xSize / xSizeCur)
				{
					while (mapY.length < ySize / ySizeCur)
					{
						if (xSizeCur == xSize / 2 || ySizeCur == ySize / 2)
						{
							start = 50;
						}else {
							start = 0;
						}
						mapY.push(start + Math.floor((
						getAt(mapX.length / 2, mapY.length / 2, map) + 
						getAt(mapX.length / 2 - 1, mapY.length / 2, map) + 
						getAt(mapX.length / 2 + 1, mapY.length / 2, map) + 
						getAt(mapX.length / 2, mapY.length / 2 - 1, map) + 
						getAt(mapX.length / 2, mapY.length / 2 + 1, map))
						/ 5) + Math.floor(Math.random() * 10) - 5);
					}
					mapX.push(mapY);
					mapY = [];
				}
				trace(map);
				map = mapX;
				mapX = [];
			}
			return map;
		}
		
		private function getTypeByHeight(x:uint, y:uint, heightmap:Array):uint
		{
			var type:uint;
			var num:uint = heightmap[x][y];
			if (num < 50)
			{
				type = Terrain.typeWater;
			}
			else
			{
				type = Terrain.typeDirt;
			}
			return type;
		}
		
		private function getAt(x:int, y:int, map:Array):uint
		{
			x = Math.floor(x);
			y = Math.floor(y);
			
			if (x < 0)
			{
				x += map.length;
			}
			else if (x > map.length - 1)
			{
				x -= map.length;
			}
			if (y < 0)
			{
				y += map.length;
			}
			else if (y > map.length - 1)
			{
				y -= map.length;
			}
			
			return map[x][y];
		}
		
		public function tick():void
		{
			for each (var a:Array in worldMap)
			{
				for each (var tile:Tile in a)
				{
					tile.tick();
				}
			}
		}
		
		public function getMap():Array
		{
			return worldMap;
		}
		
		public function addToStage():void
		{
			if (!onStage)
			{
				for each (var a:Array in worldMap)
				{
					for each (var tile:Tile in a)
					{
						FlowControl.getStage().addChild(tile);
					}
				}
				onStage = true;
			}
		}
		
		public function removeFromStage():void
		{
			if (onStage)
			{
				for each (var a:Array in worldMap)
				{
					for each (var tile:Tile in a)
					{
						FlowControl.getStage().removeChild(tile);
					}
				}
				onStage = false;
			}
		}
		
		public function getOnStage():Boolean
		{
			return onStage;
		}
	}
}