package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Being extends Sprite
	{
		private var body:Shape, xSpeed:Number = 0, ySpeed:Number = 0, leftKey:Boolean = false, rightKey:Boolean = false, upKey:Boolean = false, main:Main, speed:int, maxSpeed:int, jumpSpeed:int, canJump:Boolean, gravity:Number, size:int;
		
		public function Being(main:Main, x:int, y:int)
		{
			this.main = main;
			
			this.x = x;
			this.y = y;
			
			speed = 1;
			maxSpeed = 10;
			jumpSpeed = 10;
			canJump = true;
			gravity = 0.5;
			size = 16;
			
			main.addChild(this);
			
			draw();
		}
		
		private function draw():void
		{
			body = new Shape();
			body.graphics.lineStyle(1);
			body.graphics.beginFill(0xFFFFFF);
			body.graphics.drawCircle(size / 2, size / 2, size / 2);
			addChild(body);
			
			addEventListener(Event.ENTER_FRAME, frame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			setKeys(e, true);
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			setKeys(e, false);
		}
		
		private function setKeys(e:KeyboardEvent, value:Boolean):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT: 
					leftKey = value;
					break;
				
				case Keyboard.RIGHT: 
					rightKey = value;
					break;
				
				case Keyboard.UP: 
					upKey = value;
					break;
				
				default: 
					break;
			}
		}
		
		private function frame(e:Event):void
		{
			//gravity
			ySpeed += gravity;
			
			//max speed
			if (xSpeed > maxSpeed)
				xSpeed = maxSpeed;
			else if (xSpeed < -maxSpeed)
				xSpeed = -maxSpeed;
			
			//collison
			for each (var block:Shape in main.metaBlock)
			{
				if (hitTestObject(block))
				{
					if (block.y > y) //block down
					{
						y = block.y -  size;
						canJump = true;
						ySpeed = 0;
					}
					else if (block.y + block.height < y) //block up
					{
						if (ySpeed < 0)
							ySpeed = 0;
						y = block.y + block.height;
					}
					break;
				}
			}
			
			//key movement
			if (leftKey)
			{
				xSpeed -= speed;
			}
			if (rightKey)
			{
				xSpeed += speed;
			}
			if (upKey && canJump)
			{
				ySpeed = -jumpSpeed;
				canJump = false;
			}
			
			//movement
			x += xSpeed;
			y += ySpeed;
		}
	}
}