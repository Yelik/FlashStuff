package  
{
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Unit 
	{
		private var dex:int;
		private var str:int;
		private var def:int;
		
		public function Unit(str:int, dex:int, def:int) 
		{
			this.def = def;
			this.dex = dex;
			this.str = str;
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
		
	}

}