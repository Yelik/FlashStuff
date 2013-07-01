package com.mrizen.world
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Unit
	{
		protected var tile:Tile;
		protected var type:uint;
		protected var image:Sprite;
		protected var id:uint;
		
		protected var unitsOnTile:Array;
		protected var neighbors:Array;
		
		public function Unit(tile:Tile, type:uint)
		{
			this.tile = tile;
			this.type = type;
			
			id = FlowControl.nextId();
			image = new Sprite();
			image.addChild(findImage());
			this.tile.addUnit(this);
		}
		
		public function onTick():void
		{
			unitsOnTile = new Array();
			var units:Array = tile.getUnits();
			for each (var unit:Unit in units)
			{
				if (unit.getId() != getId())
				{
					unitsOnTile.push(unit);
				}
			}
			neighbors = tile.getNeighbors();
		}
		
		public function findImage():Sprite
		{
			var b:Sprite;
			return b;
		}
		
		public function getType():uint
		{
			return type;
		}
		
		public function getImage():Sprite
		{
			return image;
		}
		
		public function getId():uint
		{
			return id;
		}
	}
}