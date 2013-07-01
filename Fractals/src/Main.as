package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private var f:Fractal;
		
		static public var i:Main;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Main.i = this;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			f = new Fractal(["f"], ["+f--f+"], ["f"]);
		}
		
		private function keyDownListener(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.Z)
			{
				f.zoom(2);
				f.draw(0, 45);
			}
			else if (e.keyCode == Keyboard.X)
			{
				f.zoom(1 / 2);
				f.draw(0, 45);
			}else if (e.keyCode == Keyboard.I)
			{
				f.iterate();
				f.draw(0, 45);
			}
		}
	}
}