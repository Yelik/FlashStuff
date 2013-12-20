package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player extends Sprite
	{
		private var main:Main;
		private var size:int;
		private var leftKey:Boolean = false;
		private var rightKey:Boolean = false;
		private var upKey:Boolean = false;
		private var downKey:Boolean = false;
		private var xSpeed:Number = 0;
		private var ySpeed:Number = 0;
		private var speed:Number;
		
		public function Player(main:Main, x:int, y:int, size:int, speed:Number)
		{
			this.y = y;
			this.x = x;
			this.speed = speed;
			this.size = size;
			this.main = main;
			graphics.beginFill(0);
			graphics.drawRect(0, 0, size, size);
			main.addChild(this);
			addEventListener(Event.ENTER_FRAME, enterFrame);
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function enterFrame(e:Event):void
		{
			/*if (leftKey)
			{
				xSpeed = -speed;
			}
			else if (rightKey)
			{
				xSpeed = speed;
			}
			else
			{
				xSpeed = 0;
			}
			if (upKey)
			{
				ySpeed = -speed;
			}
			else if (downKey)
			{
				ySpeed = speed;
			}
			else
			{
				ySpeed = 0;
			}*/
			
			for each (var bullet:Bullet in main.bullets)
			{
				if (hitTestObject(bullet))
				{
					die();
				}
			}
			/*
			x += xSpeed;
			y += ySpeed;
			*/
			x = main.mouseX;
			y = main.mouseY;
		}
		
		private function die():void
		{
			
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
				
				case Keyboard.DOWN: 
					downKey = value;
					break;
				
				default: 
					break;
			}
		}
	}
}