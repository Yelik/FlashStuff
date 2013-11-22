package
{
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Unit
	{
		protected var dex:int;
		protected var str:int;
		protected var def:int;
		protected var weapon:Weapon;
		
		public function Unit(str:int, dex:int, def:int, weapon:Weapon)
		{
			setWeapon(weapon);
			setDef(def);
			setStr(str);
			setDex(dex);
		}
		
		protected function setDef(def:int):void
		{
			this.def = def;
		}
		
		protected function setDex(dex:int):void
		{
			this.dex = dex;
		}
		
		protected function setStr(str:int):void
		{
			this.str = str;
		}
		
		protected function setWeapon(weapon:Weapon):void
		{
			this.weapon = weapon;
		}
		
		public function getStr():int
		{
			return str;
		}
		
		public function getDex():int
		{
			return dex;
		}
		
		public function getDef():int
		{
			return def;
		}
		
		public function getWeapon():Weapon
		{
			return weapon;
		}
	
	}

}