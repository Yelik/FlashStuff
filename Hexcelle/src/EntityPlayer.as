package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityPlayer extends EntityCelle
	{
		
		public function EntityPlayer(x:int, y:int, celles:CelleMap)
		{
			super(x, y, celles);
		}
		
		override public function frame(e:Event = null):void
		{
			if (Game.stopping)
				return;
				
			moves = Game.i.keys;
			
			super.frame(e);
		}
		
		override public function die():void
		{
			super.die();
			Game.i.tryToStop();
		}
	}
}