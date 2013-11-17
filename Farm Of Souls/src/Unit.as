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
			draw();
		}
		
		private function draw():void
		{
			var t:int = main.getTileSize();
			this.graphics.lineStyle(1);
			this.graphics.moveTo(t * 0.25, t * 0.8);
			this.graphics.lineTo(t * 0.5, t * 0.5);
			this.graphics.lineTo(t * 0.75, t * 0.8);
			this.graphics.moveTo(t * 0.2, t * 0.5);
			this.graphics.lineTo(t * 0.8, t * 0.5);
			this.graphics.drawCircle(t * 0.5, t * 0.3, t * 0.2);
		}
		
		public function tick():void
		{
			this.x = pos * main.getTileSize();
		}
	}
}