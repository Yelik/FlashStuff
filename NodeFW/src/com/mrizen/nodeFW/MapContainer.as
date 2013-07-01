package com.mrizen.nodeFW 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class MapContainer extends Sprite
	{
		protected var map:Array;
		
		public function MapContainer(map:Array) 
		{
			this.map = map;
			
			for each(var i:Array in map) {
				for each(var node:Node in i) {
					node.setMapReady(true);
					addChild(node);
				}
			}
		}
		
		public function getMap():Array
		{
			return map;
		}
	}
}