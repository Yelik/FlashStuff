package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class World extends Sprite
	{
		private var gen:WorldGenerator, hills:Array;
		
		public function World()
		{
			gen = new WorldGenerator();
			hills = gen.getHills();
		}
		
		public function draw():void
		{
			graphics.lineStyle(1, 0x00FF88);
			graphics.moveTo(0, hills[0]);
			for (var i:int = 0; i < hills.length; i++)
			{
				graphics.lineTo(i, Main.i.stage.stageHeight - hills[i]);
				graphics.lineTo(i, Main.i.stage.stageHeight);
			}
		}
		
		public function getViewLeft():int
		{
			return -x;
		}
		
		public function getVeiwRight():int
		{
			return stage.stageWidth - x;
		}
		
		public function getGen():WorldGenerator
		{
			return gen;
		}
	}
}