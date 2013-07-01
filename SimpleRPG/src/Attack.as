package  
{
	/**
	 * ...
	 * @author Yelik
	 */
	public class Attack 
	{	
		private var info:Array;
		
		public function Attack(name:String, damage:int, speed:int) 
		{
			info = [name, damage, speed];
		}
		
		public function getName():String
		{
			return info[0];
		}
				
		public function getDamage():int
		{
			return info[1];
		}
				
		public function getSpeed():int
		{
			return info[2];
		}
	}
}