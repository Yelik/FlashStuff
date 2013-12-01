package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Being extends Sprite
	{
		private var body:Shape;
		private var xSpeed:Number = 0;
		private var ySpeed:Number = 0;
		private var leftKey:Boolean = false;
		private var rightKey:Boolean = false;
		private var upKey:Boolean = false;
		private var main:Main;
		private var speed:int;
		private var maxSpeed:int;
		private var jumpSpeed:int;
		private var canJump:Boolean;
		private var gravity:Number;
		private var size:int;
		private var maxGravity:int;
		private var inAirSpeed:Number;
		private var inAir:Boolean;
		private var friction:Number;
		
		public function Being(main:Main, x:int, y:int)
		{
			this.main = main;
			
			this.x = x;
			this.y = y;
			
			friction = 0.9;
			speed = 4;
			inAirSpeed = 1;
			maxSpeed = 12;
			jumpSpeed = 10;
			canJump = true;
			gravity = 0.5;
			size = 16;
			maxGravity = size;
			
			main.addChild(this);
			
			draw();
		}
		
		private function draw():void
		{
			body = new Shape();
			body.graphics.lineStyle(1);
			body.graphics.beginFill(0xFFFFFF);
			body.graphics.drawRect(0, 0, size, size);
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
			
			//collison
			inAir = true;
			
			for each (var block:Shape in main.metaBlock)
			{
				if (hitTestObject(block))
				{
					if (block.x > x)
					{
						if (block.y < y)
						{
							ySpeed = 0;
							x = block.x - width;
							canJump = true;
						}
						if (xSpeed > 0)
							xSpeed = 0;
					}
					if (block.x + block.width < x)
					{
						if (block.y < y && block.y + block.height > y)
						{
							ySpeed = 0;
							x = block.x + block.width;
						}
						if (xSpeed < 0)
							xSpeed = 0;
					}
					if (block.y > y) //block down
					{
						y = block.y - size;
						canJump = true;
						ySpeed = 0;
						inAir = false;
					}
					else if (block.y + block.height < y) //block up
					{
						if (ySpeed < 1)
							ySpeed = 1;
						y = block.y + block.height + 1;
					}
				}
			}
			
			//key movement
			if (leftKey)
			{
				if (inAir)
					xSpeed -= inAirSpeed;
				else
					xSpeed -= speed;
			}
			if (rightKey)
			{
				if (inAir)
					xSpeed += inAirSpeed;
				else
					xSpeed += speed;
			}
			
			//max speed
			if (xSpeed > maxSpeed)
				xSpeed = maxSpeed;
			else if (xSpeed < -maxSpeed)
				xSpeed = -maxSpeed;
			if (upKey && canJump)
			{
				ySpeed = -jumpSpeed;
				canJump = false;
			}
			
			if (ySpeed >= maxGravity)
				ySpeed = maxGravity;
			
			if (!inAir)
			{
				xSpeed *= friction;
			}
			
			//movement
			x += xSpeed;
			y += ySpeed;
		}
	}
}