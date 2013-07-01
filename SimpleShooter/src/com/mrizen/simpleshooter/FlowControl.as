package com.mrizen.simpleshooter
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public final class FlowControl
	{
		public static var mainRef:Main, kongLoader:KongregateLoader;
		
		public function FlowControl(main:Main)
		{
			mainRef = main;
			kongLoader = new KongregateLoader();
			var ship:Ship = new Ship();
			main.addChild(ship);
			new MediaLoader();
			new KeyListener();
		}
	}
}