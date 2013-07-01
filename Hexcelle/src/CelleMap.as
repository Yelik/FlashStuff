package
{
	import flash.display.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class CelleMap
	{
		public var map:BitmapData;
		
		public function CelleMap()
		{
			map = new BitmapData(1, 1, false, 0);
		}
		
		public function getAt(x:int, y:int):int
		{
			return map.getPixel(x, y);
		}
		
		public function setAt(x:int, y:int, value:int):void
		{
			if (x >= map.width || y >= map.height)
			{
				var temp:BitmapData = map;
				map = new BitmapData(AdvMath.largest([x, map.width + 1]), AdvMath.largest([y, map.height + 1]), false, 0);
				map.copyPixels(temp, new Rectangle(0, 0, temp.width, temp.height), new Point());
			}
			map.setPixel(x, y, value);
		}
		
		public function clone():CelleMap
		{
			var c:CelleMap = new CelleMap();
			for (var y:int = 0; y < map.height; y++)
			{
				for (var x:int = 0; x < map.width; x++)
				{
					c.setAt(x, y, getAt(x, y));
				}
			}
			return c;
		}
		
		public function convert(entity:EntityCelle):Sprite
		{
			var s:Sprite = new Sprite(), type:int;
			
			for (var y:int = 0; y < map.height; y++)
			{
				for (var x:int = 0; x < map.width; x++)
				{
					type = getAt(x, y);
					if (type != 0)
						s.addChild(new Celle(type, entity, [x, y]));
				}
			}
			
			return s;
		}
		
		public function calculateStats():Stats
		{
			var a:Stats = new Stats(0, 0), type:int;
			
			for (var y:int = 0; y < map.height; y++)
			{
				for (var x:int = 0; x < map.width; x++)
				{
					type = getAt(x, y);
					a.accel += Celle.STATEFFECTS[type].accel;
					a.maxSpeed += Celle.STATEFFECTS[type].maxSpeed;
				}
			}
			
			return a;
		}
		
		public function celleCount():int
		{
			var i:int = 0;
			
			for (var y:int = 0; y < map.height; y++)
			{
				for (var x:int = 0; x < map.width; x++)
				{
					if (getAt(x, y) != 0)
					i++;
				}
			}
			
			return i;
		}
	}
}