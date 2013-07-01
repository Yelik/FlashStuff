package com.mrizen.life 
{
	/**
	 * ...
	 * @author yelik
	 */
	public class MapGenerator 
	{
		protected var genedWeights:Array;
		protected var objects:Array;
		protected var objectWeights:Array;
		
		public function MapGenerator()
		{	
			prepMapGen();
			
			genedWeights = new Array();
			
			for (var x:uint = 0; x < objects.length; x++ ) {
				for (var i:uint = 0; i < objectWeights[x]; i++) {
					genedWeights.push(objects[x]);
				}
			}
		}
		
		protected function prepMapGen():void
		{
			objects = [Node.nodeNormID,Node.nodeLifeID];
			objectWeights = [10,1];
		}
		
		protected function interpretID(ID:uint,currentX:uint,currentY:uint,map:Array):Node
		{
			var node:Node;
			
			if (ID == Node.nodeNormID) {
				node = new NodeNorm(currentX, currentY, map);
			}else if (ID == Node.nodeLifeID) {
				node = new NodeLife(currentX, currentY, map);
			}
			
			return node;
		}
		
		public function setObjects(listValue:Array):void
		{
			objects = listValue;
		}
		
		public function genMap(x:uint,y:uint):Array
		{
			var map:Array = new Array();
			var mapY:Array = new Array();
			var currentX:uint = 0;
			var currentY:uint = 0;
			var objectAdded:Node;
			var objectType:uint;
			
			while(currentX < x){
				while(currentY < y){
					objectType = genedWeights[Math.floor(Math.random() * genedWeights.length)];
					objectAdded = interpretID(objectType, currentX, currentY, map);
					mapY.push(objectAdded);
					currentY++;
				}
				map.push(mapY);
				mapY = new Array;
				currentY = 0;
				currentX++;
			}
			
			return map;
		}
	}
}