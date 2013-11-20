package  
{
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Weapon extends Item 
	{
		private var baseDmg:int;
		private var strRatio:Number;
		private var dexRatio:Number;
		
		public function Weapon(baseDmg:int, strRatio:Number, dexRatio:Number) 
		{
			this.dexRatio = dexRatio;
			this.strRatio = strRatio;
			this.baseDmg = baseDmg;
			
		}
		
		public function getDmg(unit:Unit):int
		{
			return baseDmg + unit.getStr() * strRatio + unit.getDex() * dexRatio;
		}
	}
}