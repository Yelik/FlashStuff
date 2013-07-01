package com.mrizen.countrygen
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Generator
	{
		public static function genMap(width:int, height:int, seed:Array = null, minSize:int = 0, maxSize:int = int.MAX_VALUE, minStates:int = 0, maxStates:int = int.MAX_VALUE):Map
		{
			var m:Map = new Map(width, height, [0x000000, 0xFF0000, 0x00FF00, 0x0000FF, 0xFF00FF], 5), size:int = 0, states:int = 0, x:int, y:int, current:int;
			
			if (seed == null)
			{
				seed = [0.5];
			}
			
			current = 1;
			x = Math.random() * m.row;
			y = Math.random() * m.column;
			
			while (states < maxStates && m.hasEmpty())
			{
				while (size < maxSize)
				{
					seed.push(seed.shift());
					while (m.getTile(x, y) == current)
					{
						x += AdvMath.randBetween(-1, 1);
						y += AdvMath.randBetween(-1, 1);
					}
					m.setTile(x, y, current);
					size++;
					x += AdvMath.randBetween(-1, 1);
					y += AdvMath.randBetween(-1, 1);
					while (x < 0)
						x++;
					while (x > width)
						x--;
					while (y < 0)
						y++;
					while (y > height)
						y--;
				}
				current++;
				size = 0;
				states = current;
			}
			trace(m.mapCode);
			
			return m;
		}
	}
}


