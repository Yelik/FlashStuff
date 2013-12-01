package
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player extends Being
	{
		private var leftKey:Boolean = false;
		private var rightKey:Boolean = false;
		private var upKey:Boolean = false;
		
		public function Player(main:Main, x:int, y:int)
		{
			var size:int = 16;
			var gravity:Number = 0.5;
			
			super(main, x, y, size, gravity);
			
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
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
	
	}

}