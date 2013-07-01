package
{
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Head extends Node
	{
		
		public function Head()
		{
			size = 1;
			super(this);
		}
		
		override protected function frame(e:Event):void
		{
			moveTo(stage.mouseX, stage.mouseY);
		}
	
	}
}