package
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player extends Being
	{
		protected var leftKey:Boolean = false;
		protected var rightKey:Boolean = false;
		protected var upKey:Boolean = false;
		
		public function Player(main:Main, x:int, y:int)
		{
			var size:int = 16;
			var gravity:Number = 0.5;
			var moveSpeed:Number = 1;
			
			super(main, x, y, size, gravity, size, size, moveSpeed);
			
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		override protected function enterFrame(e:Event):void
		{
			if (leftKey)
				xSpeed += -speed;
			else if (rightKey)
				xSpeed += speed;
			super.enterFrame(e);
		}
		
		protected function keyDown(e:KeyboardEvent):void
		{
			setKeys(e, true);
		}
		
		protected function keyUp(e:KeyboardEvent):void
		{
			setKeys(e, false);
		}
		
		protected function setKeys(e:KeyboardEvent, value:Boolean):void
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
	
	}

}