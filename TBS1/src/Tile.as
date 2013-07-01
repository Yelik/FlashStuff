package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Tile
	{
		private var world:World, x:int, y:int, type:uint, image:Sprite, popImage:DisplayObject, pop:Number, neighbors:Array;
		
		public static const SIZE:int = 32, BLANK:uint = 0, FLAT:uint = 1;
		
		public static const TYPES:Array = [BLANK, FLAT], IMAGE_COLORS:Array = [], MAX_POPS:Array = [], GROWTH_RATES:Array = [], WALKABLE:Array = [], TRAVEL_RATE:Array = [];
		
		public function Tile(world:World, x:int, y:int, type:uint)
		{
			this.world = world;
			this.x = x;
			this.y = y;
			this.type = type;
			pop = 0.0;
			image = new Sprite();
			image.x = x * SIZE;
			image.y = y * SIZE;
			image.addChild(drawImage());
			popImage = image.addChild(AdvMath.drawSquare(SIZE * (pop / MAX_POPS[type]), 0xFF0000));
			image.addChild(popImage);
		}
		
		private function connect():void
		{
			neighbors = [];
			var t:Tile;
			
			t = world.getTiles().getAt(x - 1, y);
			if (WALKABLE[t.getType()])
				neighbors.push(t);
			
			t = world.getTiles().getAt(x + 1, y);
			if (WALKABLE[t.getType()])
				neighbors.push(t);
			
			t = world.getTiles().getAt(x, y - 1);
			if (WALKABLE[t.getType()])
				neighbors.push(t);
			
			t = world.getTiles().getAt(x, y + 1);
			if (WALKABLE[t.getType()])
				neighbors.push(t);
		
		}
		
		public function tick():void
		{
			if (neighbors == null)
				connect();
			pop *= 1 + GROWTH_RATES[type] - (pop / (MAX_POPS[type] / GROWTH_RATES[type]));
			if (pop > MAX_POPS[type] / 2)
			{
				var travelers:Number = pop * (pop / MAX_POPS[type]) * TRAVEL_RATE[type];
				if (neighbors.length > 0)
					pop -= travelers;
				for each (var t:Tile in neighbors)
				{
					t.addPop(travelers / neighbors.length);
				}
			}
			image.removeChild(popImage);
			popImage = image.addChild(AdvMath.drawSquare(SIZE * (pop / MAX_POPS[type]), 0xFF0000));
			image.addChild(popImage);
		}
		
		public static function prepTypes():void
		{
			IMAGE_COLORS[BLANK] = 0;
			IMAGE_COLORS[FLAT] = 0x00FF00;
			
			MAX_POPS[BLANK] = 1;
			MAX_POPS[FLAT] = 5;
			
			GROWTH_RATES[BLANK] = 0.0;
			GROWTH_RATES[FLAT] = 0.10;
			
			WALKABLE[BLANK] = false;
			WALKABLE[FLAT] = true;
			
			TRAVEL_RATE[BLANK] = 0.0;
			TRAVEL_RATE[FLAT] = 0.01;
		}
		
		private function drawImage():Shape
		{
			return AdvMath.drawSquare(SIZE, IMAGE_COLORS[type]);
		}
		
		public function getImage():Sprite
		{
			return image;
		}
		
		public function getType():uint
		{
			return type;
		}
		
		public function getPop():Number
		{
			return pop;
		}
		
		public function setPop(number:Number):void
		{
			pop = number;
		}
		
		public function addPop(value:Number):void
		{
			pop += value;
		}
	}
}