package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Player extends Sprite
	{
		static public const IDLE:int = Main.getID();
		static public const RUNNING:int = Main.getID();
		static public const RUNNING1:int = Main.getID();
		static public const RUNNING2:int = Main.getID();
		private var main:Main;
		private var state:int;
		private var idleImage:Bitmap;
		private var leftKey:Boolean;
		private var rightKey:Boolean;
		private var upKey:Boolean;
		private var running1Image:Bitmap;
		private var running2Image:Bitmap;
		
		public function Player(main:Main, x:int, y:int)
		{
			this.y = y;
			this.x = x;
			this.main = main;
			state = 0;
			addEventListener(Event.ENTER_FRAME, enterFrame);
			
			idleImage = main.getImage(IDLE);
			running1Image = main.getImage(RUNNING1);
			running2Image = main.getImage(RUNNING2);
			
			draw();
			
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
		}
		
		private function stage_keyUp(e:KeyboardEvent):void
		{
			setKeys(e, false);
		}
		
		private function stage_keyDown(e:KeyboardEvent):void
		{
			setKeys(e, true);
		}
		
		private function enterFrame(e:Event):void
		{
			draw();
			if (rightKey)
			{
				state = RUNNING;
			}
			else if (leftKey)
			{
				state = RUNNING;
			}
			else
			{
				state = IDLE;
			}
		}
		
		private function draw():void
		{
			while (numChildren)
			{
				removeChild(getChildAt(0));
			}
			if (state == IDLE)
			{
				addChild(idleImage);
			}
			else if (state == RUNNING)
			{
				addChild(running2Image);
			}
		}
		
		private function keyUpListener(e:KeyboardEvent):void
		{
		
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