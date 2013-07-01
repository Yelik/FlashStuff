package
{
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public final class AdvMath
	{
		public static function ave(numbers:Array):Number
		{
			var total:Number = 0;
			
			for each (var i:Number in numbers)
				total += i;
			
			return total / numbers.length;
		}
		
		public static function distance(startX:int, startY:int, endX:int, endY:int):Number
		{
			return Math.abs(startX - endX) + Math.abs(startY - endY);
		}
		
		public static function moveAtTarget(start:Array, target:Array, speed:Number):Array
		{
			var yDist:Number = target[0] - start[0];
			var xDist:Number = target[1] - start[1];
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
		
		public static function randBetween(max:int, min:int = 0):int
		{
			return Math.round(Math.random() * (max - min)) + min;
		}
	}
}