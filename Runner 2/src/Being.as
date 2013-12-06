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
		protected var friction:Number;
		protected var projBeing:Sprite;
		protected var main:Main;
		protected var image:Sprite;
		protected var size:int;
		protected var xSpeed:Number = 0;
		protected var ySpeed:Number = 0;
		protected var gravity:Number;
		protected var maxXSpeed:Number;
		protected var maxYSpeed:Number;
		protected var speed:Number;
		
		public function Being(main:Main, x:int, y:int, size:int, gravity:Number, maxXSpeed:Number, maxYSpeed:Number, speed:Number, friction:Number)
		{
			this.friction = friction;
			this.speed = speed;
			this.maxYSpeed = maxYSpeed;
			this.maxXSpeed = maxXSpeed;
			this.gravity = gravity;
			this.size = size;
			this.y = y;
			this.x = x;
			this.main = main;
			this.image = new Sprite;
			this.projBeing = new Sprite;
			addChild(image);
			image.graphics.lineStyle(1);
			image.graphics.drawRect(0, 0, size, size);
			projBeing.graphics.lineStyle(1);
			projBeing.graphics.drawRect(0, 0, size, size);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		protected function enterFrame(e:Event):void
		{
			projBeing.x = x;
			projBeing.y = y;
			
			ySpeed += gravity;
			
			xSpeed *= friction;
			
			projBeing.x += limitSpeed(xSpeed, maxXSpeed);
			projBeing.y += limitSpeed(ySpeed, maxYSpeed);
			
			for each (var block:Block in main.blocks)
			{
				if (this.projBeing.hitTestObject(block))
				{
					collision(block);
				}
			}
			
			xSpeed = limitSpeed(xSpeed, maxXSpeed);
			ySpeed = limitSpeed(ySpeed, maxYSpeed);
			x += xSpeed;
			y += ySpeed;
		}
		
		protected function collision(block:Block):void
		{
			if (block.y > y && block.x < x + width && block.x > x - block.width)
			{
				if (ySpeed > 0)
				{
					ySpeed = 0;
				}
				y = block.y - height;
			}
			else if (block.y < y && block.x < x && block.x > x - block.width + width)
			{
				if (ySpeed < 0)
				{
					ySpeed = 0;
				}
				y = block.y + block.height;
			}
			else if (block.x < x)
			{
				if (xSpeed < 0)
				{
					xSpeed = 0;
				}
				x = block.x + block.width;
			}
			else if (block.x > x)
			{
				if (xSpeed > 0)
				{
					xSpeed = 0;
				}
				x = block.x - width;
			}
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