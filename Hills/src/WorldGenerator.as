package
{
	import flash.display.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class WorldGenerator
	{
		protected var iters:Array, hills:Array, numIters:int, lines:Graphics, linesSprite:Sprite;
		
		public function WorldGenerator()
		{
			linesSprite = new Sprite();
			Main.i.addChild(linesSprite);
			lines = linesSprite.graphics;
			reset();
		}
		
		public function generate():void
		{
			/*iters.push(new IteratorQuad(0, 200, 1.1, 2 - 1.1, 10));
			   iters.push(new IteratorQuad(0, 600, 1.05, 2 - 1.05, 25));
			   iters.push(new IteratorQuad(100, 200, 1.5, 0.9, 5));
			 iters.push(new IteratorLine(0, 600, 6 / 4, 6 / 4, 50));*/
			
			iters.push(new IteratorQuadRandom(0, 200, 1.1, 2 - 1.1, 10, 0, 600, 1.05, 2 - 1.05, 20));
			iters.push(new IteratorQuadRandom(0, 200, 1.1, 2 - 1.1, 10, 0, 600, 1.05, 2 - 1.05, 20));
			iters.push(new IteratorQuadRandom(0, 200, 1.1, 2 - 1.1, 10, 0, 600, 1.05, 2 - 1.05, 20));
			iters.push(new IteratorLineRandom(0, 600, 11 / 8, 11 / 8, 50, 0, 600, 13 / 8, 13 / 8, 50));
			
			for (var i:int = 0; i < Main.i.stage.stageWidth; i++)
			{
				step();
			}
			
			draw();
		}
		
		public function smooth():void
		{
			if (hills.length <= 1)
			{
				return;
			}
			for (var j:int = 0; j < hills.length; j++)
			{
				if (j == 0)
				{
					hills[j].y = (hills[j].y + hills[j + 1].y) / 2;
				}
				else if (j == hills.length - 1)
				{
					hills[j].y = (hills[j].y + hills[j - 1].y) / 2;
				}
				else
				{
					hills[j].y = (hills[j].y + hills[j - 1].y + hills[j + 1].y) / 3;
				}
			}
		}
		
		public function unsmooth():void
		{
			for (var j:int = 0; j < hills.length; j++)
			{
				hills[j].y += Math.random() * 4 - 2;
			}
		}
		
		public function draw():void
		{
			lines.clear();
			lines.moveTo(0, Main.i.stage.stageHeight);
			for each (var p:Point in hills)
			{
				lines.lineStyle(2, (600 - p.y) / 400 * 0xFF << 8);
				lines.lineTo(p.x, p.y);
				lines.lineTo(p.x, Main.i.stage.stageHeight);
			}
		}
		
		public function reset():void
		{
			numIters = 0;
			iters = [];
			hills = [];
		}
		
		public function step():void
		{
			var num:Number = 0, totalWeight:int = 0;
			
			for each (var it:Iterator in iters)
			{
				it.step();
				for (var i:int = 0; i < it.getWeight(); i++)
				{
					num += it.getNum(numIters);
					totalWeight++;
				}
			}
			
			num /= totalWeight;
			hills.push(new Point(numIters, num * -1 + Main.i.stage.stageHeight));
			
			numIters++;
			
			smooth();
		}
		
		public function scroll(distance:int, gen:Boolean = true):void
		{
			if (gen)
			{
				if (numIters < findScrollDistance() + distance)
				{
					trace("stepping");
					for (var i:int = 0; i < distance * 5; i++)
					{
						step();
					}
					draw();
				}
			}
			linesSprite.x -= distance;
		}
		
		public function findScrollDistance():int
		{
			return Math.abs(linesSprite.x) + Main.i.stage.stageWidth;
		}
	}
}