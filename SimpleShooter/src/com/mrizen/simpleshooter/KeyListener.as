package com.mrizen.simpleshooter
{
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class KeyListener
	{
		public static var downKey:Boolean = false, upKey:Boolean = false, leftKey:Boolean = false, rightKey:Boolean = false, qKey:Boolean = false, eKey:Boolean = false;
		private static var up:int = 87, left:int = 65, down:int = 83, right:int = 68, q:int = 81, e:int = 69;
		
		public function KeyListener()
		{
			FlowControl.mainRef.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			FlowControl.mainRef.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == up)
			{
				upKey = true;
			}
			else if (event.keyCode == left)
			{
				leftKey = true;
			}
			else if (event.keyCode == down)
			{
				downKey = true;
			}
			else if (event.keyCode == right)
			{
				rightKey = true;
			}
			else if (event.keyCode == q)
			{
				qKey = true;
			}
			else if (event.keyCode == e)
			{
				eKey = true;
			}
		}
		
		private function keyUp(event:KeyboardEvent):void
		{
			if (event.keyCode == up)
			{
				upKey = false;
			}
			else if (event.keyCode == left)
			{
				leftKey = false;
			}
			else if (event.keyCode == down)
			{
				downKey = false;
			}
			else if (event.keyCode == right)
			{
				rightKey = false;
			}
			else if (event.keyCode == q)
			{
				qKey = false;
			}
			else if (event.keyCode == e)
			{
				eKey = false;
			}
		}
	}

}