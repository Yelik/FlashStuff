package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile extends Sprite
	{
		private var pos:int;
		private var main:Main;
		
		public function Tile(main:Main, pos:int)
		{
			this.main = main;
			this.pos = pos;
			graphics.beginFill(0x00FF00);
			graphics.lineStyle(1);
			graphics.drawRect(0, 0, 40, 40);
		}
	}
}