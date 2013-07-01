package
{
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityBot extends EntityCelle
	{
		
		public function EntityBot(x:int, y:int, celles:CelleMap)
		{
			super(x, y, celles);
		}
		
		override public function frame(e:Event = null):void
		{
			if (Game.stopping)
				return;
				
			if (Game.i.player.x >= x)
				moves[0] = true;
			else
				moves[0] = false;
			
			if (Game.i.player.y <= y)
				moves[1] = true;
			else
				moves[1] = false;
			
			if (Game.i.player.x <= x)
				moves[2] = true;
			else
				moves[2] = false;
			
			if (Game.i.player.y >= y)
				moves[3] = true;
			else
				moves[3] = false;
			
			super.frame(e);
		}
	}
}