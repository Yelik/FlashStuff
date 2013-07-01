package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityFighter extends Entity
	{
		public var player:Boolean;
		private var eBase:EntityBasic, health:int, energy:int;
		
		public function EntityFighter(entityBasic:EntityBasic)
		{
			player = false;
			
			graphic = entityBasic.graphic;
			setHitbox(Image(graphic).width, Image(graphic).height);
			
			this.eBase = entityBasic;
			health = getMaxHealth();
			energy = entityBasic.getEnergy();
		}
		
		override public function update():void
		{
			super.update();
			if (player)
			{
				Image(graphic).flipped = true;
			}
		}
		
		public function getDamage():int
		{
			return eBase.getDamage();
		}
		
		public function getSpeed():int
		{
			return eBase.getSpeed();
		}
		
		public function getMaxHealth():int
		{
			return eBase.getHealth();
		}
		
		public function getHealth():int
		{
			return health;
		}
		
		public function getEnergy():int
		{
			return energy;
		}
		
		public function getMoves():Array
		{
			return eBase.getMoves();
		}
		
		public function getName():String
		{
			return eBase.getName();
		}
		
		public function setEnergy(number:Number):void 
		{
			energy = number;
		}
	}
}