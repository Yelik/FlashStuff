package com.mrizen.life 
{
	/**
	 * ...
	 * @author yelik
	 */
	public class FlowControl 
	{
		protected var main:Main;
		protected var mapGen:MapGenerator;
		protected var map:MapContainer;
		
		public function FlowControl(main:Main, mapXSize:uint, mapYSize:uint) 
		{	
			this.main = main;
			mapGen = new MapGenerator();
			map = new MapContainer(mapGen.genMap(mapXSize, mapYSize));
			
			main.addChild(map);
		}
		
	}

}