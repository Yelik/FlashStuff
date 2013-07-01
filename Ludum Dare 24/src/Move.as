package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Move
	{
		public static var moves:Vector.<Move>;
		
		private var damageMod:int, speedMod:int, energyCost:int, name:String;
		
		public function Move(name:String, damageMod:int, speedMod:int, energyCost:int)
		{
			this.name = name;
			this.energyCost = energyCost;
			this.speedMod = speedMod;
			this.damageMod = damageMod;
		}
		
		public function getDamageMod():int
		{
			return damageMod;
		}
		
		public function getSpeedMod():int
		{
			return speedMod;
		}
		
		public function getEnergyCost():int
		{
			return energyCost;
		}
		
		public function getName():String
		{
			return name;
		}
		
		public static function getMove(name:String):Move
		{
			for each (var move:Move in moves)
				if (move.name == name)
					return move;
			
			return null;
		}
	}
}