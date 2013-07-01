package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Particle extends Sprite
	{
		protected var drawn:Boolean;
		
		public var type:Type;
		
		public static const SIZE:int = 4, PARTS:Array = [], TYPES:Array = [];
		
		public function Particle(x:int, y:int, type:Number)
		{
			move(x, y);
			this.drawn = false;
			this.type = TYPES[type];
			PARTS.push(this);
			
			Main.self.addChild(this);
			addEventListener(Event.ENTER_FRAME, frame);
		}
		
		protected function frame(e:Event = null):void
		{
			if (stage != null)
			{
				if (!drawn)
				{
					draw();
				}
				if (type.falls)
				{
					move(0, 1);
				}
				
				if (x < 0)
					x = 0;
				else if (x + SIZE >= stage.stageWidth)
					x = stage.stageWidth - SIZE;
				if (y < 0)
					y = 0;
				else if (y + SIZE >= stage.stageHeight)
					y = stage.stageHeight - SIZE;
			}
		}
		
		protected function draw():void
		{
			graphics.clear();
			graphics.beginFill(type.color, type.alpha);
			graphics.drawRect(0, 0, Particle.SIZE, Particle.SIZE);
			graphics.endFill();
		}
		
		protected function collide(p:Particle):void
		{
			if (type.density > p.type.density)
			{
				p.dieFrom(this);
			}
		}
		
		protected function move(x:int, y:int, relative:Boolean = true):void
		{
			x *= SIZE;
			y *= SIZE;
			if (relative)
			{
				this.x += x;
				this.y += y;
				return;
			}
			this.x = x;
			this.y = y;
		}
		
		protected function dieFrom(p:Particle):void
		{
			die();
		}
		
		protected function die():void
		{
			Particle.PARTS.splice(PARTS.indexOf(this), 1);
			if (parent != null)
			{
				parent.removeChild(this);
			}
		}
		
		protected function atPoint(x:int, y:int):Boolean
		{
			return this.x == x && this.y == y;
		}
	}
}