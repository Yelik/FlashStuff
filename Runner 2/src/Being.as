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
		public var mapX:Number;
		public var mapY:Number;
		protected var onGround:Boolean;
		
		public function Being(main:Main, x:int, y:int, size:int, gravity:Number, maxXSpeed:Number, maxYSpeed:Number, speed:Number, friction:Number)
		{
			this.friction = friction;
			this.speed = speed;
			this.maxYSpeed = maxYSpeed;
			this.maxXSpeed = maxXSpeed;
			this.gravity = gravity;
			this.size = size;
			this.mapY = y;
			this.mapX = x;
			this.main = main;
			this.image = new Sprite;
			this.projBeing = new Sprite;
			addChild(image);
			if (main.debug)
				main.addChild(projBeing);
			
			image.graphics.lineStyle(1);
			image.graphics.drawRect(0, 0, size, size);
			projBeing.graphics.lineStyle(1);
			projBeing.graphics.beginFill(0xFF00FF);
			projBeing.graphics.drawRect(0, 0, size, size);
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		protected function enterFrame(e:Event):void
		{
			projBeing.x = x;
			projBeing.y = y;
			
			ySpeed += gravity;
			if (onGround)
			{
				xSpeed *= friction;
			}
			
			projBeing.x += limitSpeed(xSpeed, maxXSpeed);
			projBeing.y += limitSpeed(ySpeed, maxYSpeed);
			onGround = false;
			for each (var block:Block in main.blocks)
			{
				if (this.projBeing.hitTestObject(block))
				{
					collision(block);
					onGround = true;
				}
			}
			
			xSpeed = limitSpeed(xSpeed, maxXSpeed);
			ySpeed = limitSpeed(ySpeed, maxYSpeed);
			mapX += xSpeed;
			mapY += ySpeed;
		}
		
		protected function collision(block:Block):void
		{
			if (mapY < block.mapY && mapX < block.mapX + block.width && mapX > block.mapX - width) // down
			{
				mapY = block.mapY - height;
				if (ySpeed > 0)
				{
					ySpeed = 0;
				}
			}
			else if (mapX > block.mapX && mapY < block.mapY + block.height && mapY > block.mapY - height) //left
			{
				mapX = block.mapX + block.width;
				if (xSpeed < 0)
				{
					xSpeed = 0;
				}
			}
			else if (mapX < block.mapX + width && mapY < block.mapY + block.height && mapY > block.mapY - height) //right
			{
				mapX = block.mapX - width;
				if (xSpeed > 0)
				{
					xSpeed = 0;
				}
			}
			else if (mapY > block.mapY && mapX < block.mapX + block.width && mapX > block.mapX - width) //up
			{
				mapY = block.mapY + block.height;
				if (ySpeed < 0)
				{
					ySpeed = 0;
				}
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