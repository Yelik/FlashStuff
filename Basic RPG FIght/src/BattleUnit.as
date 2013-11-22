package
{
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class BattleUnit extends Unit
	{
		protected var health:int;
		
		public function BattleUnit(unit:Unit)
		{
			super(unit.getStr(), unit.getDex(), unit.getDef(), unit.getWeapon());
			setHealth(getDef());
			traceStats();
		}
		
		protected function setHealth(health:int):void
		{
			this.health = health;
		}
		
		protected function traceStats():void
		{
			trace(health, str, dex, weapon.getDmg(this));
		}
	}
}