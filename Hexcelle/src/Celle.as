package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Celle extends Sprite
	{
		public var type:int, image:Shape, entity:EntityCelle, health:int, pos:Array;
		
		public static const SIZE:int = 8, COLORS:Array = [0, 0xFF0000, 0x00FF00, 0x0000FF], HEALTHS:Array = [0, 2, 2, 1], STATEFFECTS:Array = [new Stats(0, 0), new Stats(1, 2), new Stats(2, 5), new Stats(3, 8)];
		
		public function Celle(type:int, entity:EntityCelle, pos:Array)
		{
			this.type = type;
			this.entity = entity;
			this.pos = pos;
			
			x = pos[0] * (SIZE * 1.5);
			y = pos[1] * (SIZE * 2) + (pos[0] % 2 * SIZE);
			
			health = HEALTHS[type];
			image = AdvMath.drawHexagon(SIZE, COLORS[type]);
			
			addChild(image);
			entity.image.addEventListener(Event.ENTER_FRAME, frame);
		}
		
		public function die():void
		{
			entity.image.removeEventListener(Event.ENTER_FRAME, frame);
			entity.celles.removeChild(this);
		}
		
		public function change(type:int):void
		{
			entity.celleMap.setAt(pos[0], pos[1], type);
			entity.regenCelles();
		}
		
		public function frame(e:Event = null):void
		{
			if (Game.stopping)
				return;
				
			if (AdvMath.randBetween(0, 1000) == 1)
			{
				health--;
			}
			
			if (health <= 0)
				change(type - 1);
		}
	}
}
