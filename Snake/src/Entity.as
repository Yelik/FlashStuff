package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity extends Sprite
	{
		private var image:Array, keys:Array;
		
		public static const ZOOM:int = 6;
		
		public function Entity(length:int)
		{
			image = genImage(length);
			addImageToStage();
			keys = [];
			addEventListener(Event.ENTER_FRAME, frame);
			Main.i.stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
			Main.i.stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
		}
		
		private function frame(e:Event = null):void
		{
			image[0].x = stage.mouseX;
			image[0].y = stage.mouseY;
		}
		
		protected function genImage(length:int):Array
		{
			var a:Array = [];
			a[0] = new Dot();
			for (var i:int = 1; i < length; i++)
			{
				a[i] = new Dot();
				a[i].setLeader(a[i - 1]);
			}
			return a;
		}
		
		protected function addImageToStage():void
		{
			for each (var d:Dot in image)
			{
				addChild(d);
			}
			removeChild(image[0]);
		}
		
		private function stage_keyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.DOWN: 
					keys[0] = false;
					break;
				case Keyboard.UP: 
					keys[2] = false;
					break;
				case Keyboard.LEFT: 
					keys[1] = false;
					break;
				case Keyboard.RIGHT: 
					keys[3] = false;
					break;
			}
		}
		
		private function stage_keyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.DOWN: 
					keys[0] = true;
					break;
				case Keyboard.UP: 
					keys[2] = true;
					break;
				case Keyboard.LEFT: 
					keys[1] = true;
					break;
				case Keyboard.RIGHT: 
					keys[3] = true;
					break;
			}
		}
	}
}