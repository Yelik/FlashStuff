package com.mrizen.life 
{
	/**
	 * ...
	 * @author yelik
	 */
	public class NodeLife extends Node 
	{
		
		public function NodeLife(xRef:uint, yRef:uint, mapRef:Array) 
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
			life = 1;
		}
	}
}