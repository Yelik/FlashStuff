package com.mrizen.scrollingshooter.utilities
{
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public final class AdvMath
	{
		public static function moveAtTarget(start:Point, target:Point, speed:Number):Array
		{
			var yDist:Number = target.x - start.x;
			var xDist:Number = target.y - start.y;
			var angle:Number = Math.atan2(yDist, xDist);
			return [Math.sin(angle) * speed, Math.cos(angle) * speed];
		}
		
		public static function radiansToDegres(radians:Number):Number
		{
			return Math.abs(radians / (Math.PI / 180));
		}
		
		public static function degreesToRadians(degrees:Number):Number
		{
			return Math.abs(degrees / (180 / Math.PI));
		}
		
		public static function toggle(boolean:Boolean):Boolean
		{
			if (boolean)
			{
				return !boolean;
			}
			else
			{
				return boolean;
			}
		}
		
		public static function getBetween(max:int, min:int = 0):int
		{
			return Math.round(Math.random() * (max - min)) + min;
		}
	}
}


