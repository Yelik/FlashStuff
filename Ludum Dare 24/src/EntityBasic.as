package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityBasic extends Entity
	{
		[Embed(source="../assets/entities/default.png")]
		private const GRAPHIC_DEFAULT:Class;
		
		protected var level:int, damageMod:int, healthMod:int, speedMod:int, eName:String;
		
		public function EntityBasic(level:int, damage:int, health:int, speed:int, name:String = "basic")
		{
			this.eName = name;
			this.speedMod = speed;
			this.healthMod = health;
			this.damageMod = damage;
			this.level = level;
			graphic = getImage();
		}
		
		public function getSong():Sfx
		{
			return null;
		}
		
		public function getMoves():Array
		{
			return [Move.getMove("punch")];
		}
		
		public function getEnergy():int
		{
			return getBaseSpeed();
		}
		
		public function getEnergyRegen():int
		{
			return getBaseSpeed() / 5;
		}
		
		public function getDamage():int
		{
			return getBaseDamage() + damageMod;
		}
		
		public function getHealth():int
		{
			return getBaseHealth() + healthMod;
		}
		
		public function getSpeed():int
		{
			return getBaseSpeed() + speedMod;
		}
		
		public function getName():String
		{
			return eName;
		}
		
		protected function getImage():Image
		{
			return new Image(GRAPHIC_DEFAULT);
		}
		
		protected function getBaseDamage():int
		{
			return level;
		}
		
		protected function getBaseHealth():int
		{
			return level * 4;
		}
		
		protected function getBaseSpeed():int
		{
			return level;
		}
	}
}