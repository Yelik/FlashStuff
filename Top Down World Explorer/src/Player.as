package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player
	{
		public var main:Main;
		public var y:int;
		public var x:int;
		public var leftKey:Boolean;
		public var rightKey:Boolean;
		public var upKey:Boolean;
		public var image:Sprite;
		public var xSpeed:Number;
		public var speed:Number;
		
		public function Player(main:Main, x:int, y:int)
		{
			this.main = main;
			this.x = x;
			this.y = y;
			this.image = new Sprite;
			image.x = main.stage.stageWidth / 2;
			image.y = main.stage.stageHeight / 2;
			image.graphics.lineStyle(1);
			image.graphics.drawRect(0, 0, 16, 16);
			main.addChild(image);
			xSpeed = 0;
			ySpeed = 0;
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			image.addEventListener(Event.ENTER_FRAME, image_enterFrame);
		}
		
		private function image_enterFrame(e:Event):void
		{
			if (leftKey)
				xSpeed += -speed;
			else if (rightKey)
				xSpeed += speed;
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