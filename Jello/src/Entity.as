package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity extends Sprite
	{
		private var dots:Array, spacing:int, spaceToggle:Boolean, dot:Dot, color:int, centerX:int, centerY:int, repluseStrength:int, startX:int, startY:int, id:int;
		
		public function Entity(startX:int, startY:int, numDots:int, spacing:int, repluseStrength:int, color:int)
		{
			id = 0;
			this.startY = startY;
			this.startX = startX;
			this.repluseStrength = repluseStrength;
			this.spacing = spacing;
			this.color = color;
			genDots(numDots);
			spaceToggle = false;
			Main.i.stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
		}
		
		private function stage_keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				spaceToggle = !spaceToggle;
				dot = dots[Math.floor(Math.random() * dots.length)];
			}
		}
		
		private function enterFrame(e:Event = null):void
		{
			if (spaceToggle)
			{
				dot.x = stage.mouseX;
				dot.y = stage.mouseY;
			}
			centerX = centerY = 0;
			for each (var d:Dot in dots)
			{
				centerX += d.x;
				centerY += d.y;
			}
			centerX /= dots.length;
			centerY /= dots.length;
		}
		
		private function genDots(numDots:int):void
		{
			var t:int;
			dots = [];
			for (var i:int = 0; i < numDots; i++)
				dots.push(new Dot(startX, startY, this, id++));
			for (i = 0; i < dots.length; i++)
			{
				var x:int = i - 1;
				var y:int = i + 1;
				if (x < 0)
					x += dots.length;
				if (y > dots.length - 1)
					y -= dots.length - 1;
				dots[i].setConnects([dots[x], dots[y]]);
			}
			
			for each (var dot:Dot in dots)
				addChild(dot);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		public function getDots():Array
		{
			return dots;
		}
		
		public function setSpacing(spacing:int):void
		{
			this.spacing = spacing;
		}
		
		public function getSpacing():int
		{
			return spacing;
		}
		
		public function getColor():int
		{
			return color;
		}
		
		public function getCenter():Array
		{
			return [centerX, centerY];
		}
		
		public function getRepluseStrength():int
		{
			return repluseStrength;
		}
	}
}