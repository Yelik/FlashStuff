package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Unit extends Sprite
	{
		private var main:Main;
		private var pos:int;
		
		public function Unit(main:Main, pos:int) 
		{
			this.pos = pos;
			this.main = main;
			this.graphics.lineStyle(1);
			this.graphics.lineTo(5, 5);
			trace("f")
		}
		
	}

}