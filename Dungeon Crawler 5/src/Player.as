package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player extends Sprite
	{
		public var type:int;
		public var power:Number;
		public var health:Number;
		public var skill:Number;
		public var speed:Number;
		public var pName:String;
		
		static public const BASIC:int = 0;
		static public const FIRE:int = 1;
		static public const ICE:int = 2;
		static public const EARTH:int = 3;
		static public const AIR:int = 4;
		
		static private const weakRatio:Number = 0.7;
		static private const strongRatio:Number = 1.3;
		
		public function Player(pName:String, health:Number, power:Number, speed:Number, skill:Number, type:int = Player.BASIC)
		{
			this.pName = pName;
			this.type = type;
			this.power = power;
			this.health = health;
			this.skill = skill;
			this.speed = speed;
		}
		
		public static function getDamageRatio(atkType:int = BASIC, defType:int = BASIC):Number
		{
			if (atkType == FIRE)
			{
				if (defType == EARTH)
				{
					return weakRatio;
				}
				else if (defType == AIR)
				{
					return strongRatio;
				}
				else
				{
					return 1;
				}
			}
			else if (atkType == EARTH)
			{
				if (defType == FIRE)
				{
					return weakRatio;
				}
				else if (defType == ICE)
				{
					return strongRatio;
				}
				else
				{
					return 1;
				}
			}
			else if (atkType == ICE)
			{
				if (defType == AIR)
				{
					return weakRatio;
				}
				else if (defType == EARTH)
				{
					return strongRatio;
				}
				else
				{
					return 1;
				}
			}
			else if (atkType == AIR)
			{
				if (defType == FIRE)
				{
					return weakRatio;
				}
				else if (defType == ICE)
				{
					return strongRatio;
				}
				else
				{
					return 1;
				}
			}
			else
			{
				return 1;
			}
		}
	}
}