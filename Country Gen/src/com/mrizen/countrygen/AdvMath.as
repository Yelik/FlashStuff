package com.mrizen.countrygen
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class AdvMath
	{
		public static function randBetween(min:int, max:int):int
		{
			return Math.floor(Math.random() * (1 + max - min)) + min;
		}
		
		public static function indexToXY(i:int, width:int):Array
		{
			var xy:Array = [0,0];
			while (i > width)
			{
				xy[1]++;
				i -= width;
			}
			xy[0] = i & width;
			
			return xy;
		}
	}
}


