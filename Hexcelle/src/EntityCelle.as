package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityCelle extends Entity
	{
		public var celles:Sprite, moves:Array, celleMap:CelleMap;
		
		public function EntityCelle(x:int, y:int, celles:CelleMap)
		{
			celleMap = celles;
			super(x, y);
			moves = [false, false, false, false];
			this.celles = celles.convert(this);
			image.addChild(this.celles);
		}
		
		override public function frame(e:Event = null):void
		{
			if (Game.stopping)
				return;
				
			if (moves[0])
				speeds[0] += accel;
			if (moves[1])
				speeds[1] -= accel;
			if (moves[2])
				speeds[0] -= accel;
			if (moves[3])
				speeds[1] += accel;
			
			super.frame(e);
		}
		
		override public function updateStats():void
		{
			var stats:Stats = celleMap.calculateStats();
			accel = stats.accel;
			maxSpeed = stats.maxSpeed;
			friction = getFriction();
			if (celleMap.celleCount() == 0)
			{
				die();
			}
		}
		
		public function regenCelles():void 
		{
			for (var i:int = 0; i < celles.numChildren; i++) 
			{
				Celle(celles.getChildAt(i)).die();
			}
			celles.parent.removeChild(celles);
			celles = celleMap.convert(this);
			image.addChild(celles);
			updateStats();
		}
	}
}