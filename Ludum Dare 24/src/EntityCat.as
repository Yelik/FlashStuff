package
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityCat extends EntityBasic
	{
		[Embed(source="../assets/entities/cat.png")]
		private const GRAPHIC_CAT:Class;
		
		[Embed(source="../assets/sound/Pink Panther song.mp3")]
		private const PINK_PANTHER_SONG:Class;
		
		public function EntityCat(level:int, damage:int, health:int, speed:int, name:String = "panthy")
		{
			super(level, damage, health, speed, name);
		}
		
		override public function getMoves():Array
		{
			return [Move.getMove("slash"), Move.getMove("pounce")];
		}
		
		override public function getSong():Sfx
		{
			return new Sfx(PINK_PANTHER_SONG);
		}
		
		override protected function getImage():Image
		{
			return new Image(GRAPHIC_CAT);
		}
		
		override protected function getBaseSpeed():int
		{
			return super.getBaseSpeed() * 3;
		}
		
		override protected function getBaseDamage():int
		{
			return super.getBaseDamage() * 2;
		}
	}
}