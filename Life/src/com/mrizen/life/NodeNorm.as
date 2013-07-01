package com.mrizen.life 
{
	/**
	 * ...
	 * @author yelik
	 */
	public class NodeNorm extends Node 
	{
		
		public function NodeNorm(xRef:uint, yRef:uint, mapRef:Array) 
		{
			super(xRef, yRef, mapRef);
		}
		
		override protected function setBehavior():void
		{
			drawnNode = true;
			links = true;
			linkTo = true;
			range = 1;
			hasLife = true;
			dies = true;
			lives = true;
		}
	}
}