package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class AdvMath
	{
		public static function largest(numbers:Array):Number
		{
			var n:Number = -1;
			for each (var i:Number in numbers)
			{
				if (i > n)
				{
					n = i;
				}
			}
			return n;
		}
		
		public static function distance(startX:int, startY:int, endX:int, endY:int):Number
		{
			return Math.abs(startX - endX) + Math.abs(startY - endY);
		}
		
		public static function randBetween(min:int, max:int):int
		{
			return Math.floor(Math.random() * (1 + max - min)) + min;
		}
		
		public static function indexToXY(i:int, width:int):Array
		{
			var xy:Array = [0, 0];
			while (i > width)
			{
				xy[1]++;
				i -= width;
			}
			xy[0] = i & width;
			
			return xy;
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
		
		public static function getBetween(min:Number, max:Number):Number
		{
			return Math.random() * (max - min) + min;
		}
		
		public static function add(a1:Array, a2:Array):Array
		{
			a1 = a1.concat();
			a2 = a2.concat();
			a2 = a2.concat();
			for (var i:int = 0; i < AdvMath.largest([a1.length, a2.length]); i++)
			{
				a1[i] = a1[i] + a2[i];
			}
			
			return a1;
		}
		
		public static function randChoice(types:Array):uint
		{
			return types[Math.floor(Math.random() * types.length)];
		}
		
		static public function drawSquare(size:int, color:uint):Shape
		{
			var s:Shape = new Shape();
			s.graphics.lineStyle(1);
			s.graphics.beginFill(color);
			s.graphics.moveTo(0, 0);
			s.graphics.lineTo(size, 0);
			s.graphics.lineTo(size, size);
			s.graphics.lineTo(0, size);
			s.graphics.lineTo(0, 0);
			return s;
		}
		
		public static function drawHexagon(size:int, color:uint):Shape
		{
			var s:Shape = new Shape();
			s.graphics.lineStyle(1);
			s.graphics.beginFill(color);
			s.graphics.moveTo(-size, 0);
			s.graphics.lineTo(-size / 2, -size);
			s.graphics.lineTo(size / 2, -size);
			s.graphics.lineTo(size, 0);
			s.graphics.lineTo(size / 2, size);
			s.graphics.lineTo(-size / 2, size);
			s.graphics.lineTo(-size, 0);
			return s;
		}
		
		public static function drawJaggedLine(start:Array, end:Array, points:int, jaggedness:int, image:Sprite):Sprite
		{
			var ps:Array = [];
			for (var i:int = 0; i < points; i++)
			{
				ps[i] = [start[0] + (end[0] / (points - i)) + AdvMath.getBetween(jaggedness, -jaggedness), start[1] + (end[1] / (points - i)) + AdvMath.getBetween(jaggedness, -jaggedness)];
			}
			ps.push(end);
			
			image.graphics.lineStyle(1);
			image.graphics.moveTo(start[0], start[1]);
			for each (var p:Array in ps)
			{
				image.graphics.lineTo(p[0], p[1]);
			}
			return image;
		}
	}
}