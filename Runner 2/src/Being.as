package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Being extends Sprite
	{
		private var main:Main;
		private var image:Sprite;
		private var size:int;
		private var xSpeed:Number = 0;
		private var ySpeed:Number = 0;
		private var gravity:Number;
		private var maxXSpeed:int;
		private var maxYSpeed:int;
		
		public function Being(main:Main, x:int, y:int, size:int, gravity:Number, maxXSpeed:int, maxYSpeed:int)
		{
			this.maxYSpeed = maxYSpeed;
			this.maxXSpeed = maxXSpeed;
			this.gravity = gravity;
			this.size = size;
			this.y = y;
			this.x = x;
			this.main = main;
			this.image = new Sprite;
			addChild(image);
			image.graphics.lineStyle(1);
			image.graphics.drawRect(0, 0, size, size);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			ySpeed += gravity;
			
			y += ySpeed;
			x += xSpeed;
		}
		
		private function limitSpeed(speed:Number, maxSpeed:int):int
		{
			if (speed > maxSpeed)
			{
				speed = maxSpeed;
			}
			else if (speed < -maxSpeed)
			{
				
			}
			return speed;
		}
	}