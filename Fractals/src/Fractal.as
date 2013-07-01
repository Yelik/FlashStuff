package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Fractal
	{
		private var image:Sprite, curr:Array, vals:Array, vars:Array, n:uint, g:Graphics, x:uint, y:uint;
		private var lineSize:int;
		
		public function Fractal(vars:Array, vals:Array, curr:Array)
		{
			this.vars = vars;
			this.vals = vals;
			this.curr = curr;
			n = 0;
			lineSize = 1;
			
			image = new Sprite();
			g = image.graphics;
			Main.i.addChild(image);
		}
		
		public function zoom(amount:Number):void
		{
			if (lineSize > -1 && lineSize < 1)
				lineSize = 1;
			lineSize *= amount;
		}
		
		public function draw(startDir:int, rateOfTurn:int):void
		{
			g.clear();
			g.lineStyle(1);
			x = Main.i.stage.stageWidth / 2;
			y = Main.i.stage.stageHeight / 2;
			g.moveTo(x, y);
			
			var dir:int = startDir, rate:int = rateOfTurn, line:int = 0;
			
			for each (var s:String in curr)
			{
				line++;
				g.lineStyle(1, line << 8);
				if (s == "+")
					dir += rate;
				else if (s == "-")
					dir -= rate;
				else if (s == "f" || s == "b")
				{
					while (dir >= 360)
					{
						dir -= 360;
					}
					while (dir < 0)
					{
						dir += 360;
					}
					
					if (dir == 0)
					{
						x += lineSize;
					}
					else if (dir == 45)
					{
						x += lineSize;
						y -= lineSize;
					}
					else if (dir == 90)
					{
						y -= lineSize;
					}
					else if (dir == 135)
					{
						x -= lineSize;
						y -= lineSize;
					}
					else if (dir == 180)
					{
						x -= lineSize;
					}
					else if (dir == 225)
					{
						x -= lineSize;
						y += lineSize;
					}
					else if (dir == 270)
					{
						y += lineSize;
					}
					else if (dir == 315)
					{
						x += lineSize;
						y += lineSize;
					}
					else
					{
						trace("error");
					}
				}
				g.lineTo(x, y);
			}
		}
		
		public function iterate():void
		{
			n++;
			var d:Boolean;
			for (var i1:uint = 0; i1 < curr.length; i1++)
			{
				d = false;
				for (var i2:uint = 0; i2 < vars.length; i2++)
				{
					if (d)
						break;
					if (curr[i1] == vars[i2])
					{
						d = true;
						curr[i1] = vals[i2];
					}
				}
			}
			
			var s:String;
			for (i1 = 0; i1 < curr.length; i1++)
			{
				s = curr[i1];
				
				if (s.length > 1)
				{
					curr[i1] = s.charAt(0);
					for (i2 = 1; i2 < s.length; i2++)
					{
						curr.splice(i1, 0, s.charAt(i2));
					}
					i1 += s.length;
				}
			}
		}
		
		public function getInfo():String
		{
			return n + " " + curr;
		}
	}
}