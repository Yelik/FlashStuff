package
{
	
	public final class AdvMath
	{
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
		
		public static function distance(point1:Array, point2:Array):Number
		{
			return Math.sqrt((point2[0] - point1[0]) ^ 2 + (point2[1] - point1[1]) ^ 2);
		}
	}
}

