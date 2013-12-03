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
		protected var main:Main;
		protected var image:Sprite;
		protected var size:int;
		protected var xSpeed:Number = 0;
		protected var ySpeed:Number = 0;
		protected var gravity:Number;
		protected var maxXSpeed:Number;
		protected var maxYSpeed:Number;
		protected var speed:Number;
		
		public function Being(main:Main, x:int, y:int, size:int, gravity:Number, maxXSpeed:Number, maxYSpeed:Number, speed:Number)
		{
			this.speed = speed;
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
		
		protected function enterFrame(e:Event):void
		{
			ySpeed += gravity;
			
			xSpeed = limitSpeed(xSpeed, maxXSpeed);
			ySpeed = limitSpeed(ySpeed, maxYSpeed);
			
			x += xSpeed;
			y += ySpeed;
		}
		
		protected function limitSpeed(speed:Number, maxSpeed:int):Number
		{
			if (speed > maxSpeed)
			{
				speed = maxSpeed;
			}
			else if (speed < -maxSpeed)
			{
				speed = -maxSpeed;
			}
			return speed;
		}
	}
}