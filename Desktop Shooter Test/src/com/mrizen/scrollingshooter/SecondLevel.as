package com.mrizen.scrollingshooter
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class SecondLevel extends Sprite
	{
		public function load():void
		{
			FlowControl.mainRef.addChild(this);
			trace(getName() + " loaded");
		}
		
		public function unload():void
		{
			FlowControl.mainRef.removeChild(this);
			trace(getName() + " unloaded");
		}
		
		protected function getName():String
		{
			return "Second Level Base Class";
		}
	}
}
