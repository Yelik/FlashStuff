package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		protected var gen:WorldGenerator;
		
		public static var i:Main;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			i = this;
			addChild(new FPSCounter());
			gen = new WorldGenerator();
			gen.generate();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, i_keyDown);
		}
		
		private function i_keyDown(e:KeyboardEvent):void
		{
			var i:int;
			if (e.keyCode == Keyboard.SPACE)
			{
				if (e.shiftKey == false)
				{
					for (i = 0; i < 1; i++)
					{
						gen.smooth();
					}
				}
				else
				{
					for (i = 0; i < 1; i++)
					{
						gen.unsmooth();
					}
				}
				gen.draw();
			}
			else if (e.keyCode == Keyboard.ENTER)
			{
				gen.reset();
				gen.generate();
			}
			else if (e.keyCode == Keyboard.RIGHT)
			{
				gen.scroll(5);
			}else if (e.keyCode == Keyboard.LEFT)
			{
				gen.scroll( -5, false);
			}
		}
	}
}