package
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityTurtle extends EntityBasic
	{
		[Embed(source="../assets/entities/turtle.png")]
		private const GRAPHIC_TURTLE:Class;
		
		[Embed(source="../assets/sound/Rocky theme song.mp3")]
		private const ROCKY_SONG:Class
		
		public function EntityTurtle(level:Number, damage:int, health:int, speed:int, name:String = "rocky")
		{
			super(level, damage, health, speed, name);
		}
		
		override public function getSong():Sfx
		{
			return new Sfx(ROCKY_SONG);
		}
		
		override public function getMoves():Array
		{
			return [Move.getMove("punch"), Move.getMove("roll")];
		}
		
		override public function getEnergy():int
		{
			return getBaseSpeed() * 5;
		}
		
		override public function getEnergyRegen():int
		{
			return getBaseSpeed() * 2.5;
		}
		
		override protected function getImage():Image
		{
			return new Image(GRAPHIC_TURTLE);
		}
		
		override protected function getBaseSpeed():int
		{
			return super.getBaseSpeed() * 0.5;
		}
		
		override protected function getBaseHealth():int
		{
			return super.getBaseHealth() * 2;
		}
		
		override protected function getBaseDamage():int
		{
			return super.getBaseDamage() * 0.8;
		}
	}
}