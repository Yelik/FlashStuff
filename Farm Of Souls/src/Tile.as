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
		private var land:Sprite
		private var build:Building;
		
		public function Tile(main:Main, pos:int)
		{
			sgetMain(main);
			this.pos = pos;
			land = new Sprite
			addChild(land);
			land.graphics.beginFill(0x00FF00);
			land.graphics.lineStyle(1);
			land.graphics.drawRect(0, 0, 40, 40);
		}
		
		public function sgetBuild(build:Building = null):Building
		{
			if (build != null)
			{
				this.build = build;
			}
			return this.build;
		}
		
		public function tick():void
		{
			if (build != null)
				build.tick();
		}
		
		public function sgetMain(main:Main = null):Main
		{
			if (main != null)
			{
				this.main = main;
			}
			return this.main;
		}
		
		public function getPos():int
		{
			return pos;
		}
	}
}