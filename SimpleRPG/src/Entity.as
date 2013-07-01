package  
{
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity 
	{
		private var stats:Array, statValues:Array, attacks:Array;
		
		public function Entity(name:String) 
		{
			stats = [];
			statValues = [];
			attacks = [];
			addStat("name", name);
			addStat("speed", "5");
			addStat("health", "20");
			attacks.push(new Attack("swipe", 3, 5), new Attack("slash", 5, 2));
			
		}
		
		public function addStat(name:String, value:String):void
		{
			if (stats.indexOf(name) != -1)
				throw(new Error("Stat name already used"));
			stats.push(name);
			statValues.push(value);
		}
		
		public function setStat(name:String, value:int):void
		{
			statValues[stats.indexOf(name)] = value;
		}
		
		public function getStat(name:String):int
		{
			return statValues[stats.indexOf(name)];
		}
	}
}