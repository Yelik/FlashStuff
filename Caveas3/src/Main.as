package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	public class Main extends Sprite
	{
		public var map:Map, reset:Boolean = false;
		
		// CONSTRUCTOR
		public function Main():void
		{
			map = new Map(128, 128);
			addChild(map);
			map.scaleX = 4;
			map.scaleY = 4;
			caveGen();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, evKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, evKeyRelease);
		}
		
		// GENERATE A CAVE
		public function caveGen():void
		{
			// try this with "WIDE" and "THIN" as well!
			map.generateCave(100, 0, 1, "WIDE");
		}
		
		// KEYBOARD PRESS
		public function evKeyPress(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.ENTER)
			{
				if (!reset)
				{
					reset = true;
					caveGen();
				}
			}
		}
		
		// KEYBOARD RELEASE
		public function evKeyRelease(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.ENTER)
				reset = false;
		}
	}
}