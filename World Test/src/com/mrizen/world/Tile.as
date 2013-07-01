package com.mrizen.world
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Tile extends Sprite
	{
		private var world:World;
		private var worldMap:Array;
		private var terrain:Terrain;
		private var units:Array;
		private var neighbors:Array;
		
		private var xRef:uint;
		private var yRef:uint;
		
		private static const size:uint = 4;
		private static const buffer:uint = 0;
		
		public function Tile(world:World, xRef:uint, yRef:uint, terrainType:uint)
		{
			this.world = world;
			this.worldMap = this.world.getMap();
			terrain = new Terrain(this, terrainType);
			addChild(terrain.getImage());
			units = new Array();
			
			this.xRef = xRef;
			this.yRef = yRef;
			
			x = (xRef * (size + buffer)) + buffer;
			y = (yRef * (size + buffer)) + buffer;
		}
		
		public function tick():void
		{
			if (worldMap == null)
			{
				worldMap = world.getMap();
			}
			neighbors = findNeighbors(xRef, yRef);
			terrain.tick();
			for each (var unit:Unit in units)
			{
				unit.onTick();
			}
		}
		
		protected function findNeighbors(xRef:uint, yRef:uint):Array
		{
			var neighbors:Array = new Array();
			
			neighbors.push(findTileAt(xRef + 1, yRef));
			neighbors.push(findTileAt(xRef, yRef + 1));
			neighbors.push(findTileAt(xRef - 1, yRef));
			neighbors.push(findTileAt(xRef, yRef - 1));
			
			return neighbors;
		}
		
		protected function findTileAt(xRef:uint, yRef:uint):Tile
		{
			var target:Tile;
			
			if (xRef < worldMap.length - 1 && xRef >= 0)
			{
				if (yRef < worldMap[xRef].length - 1 && yRef >= 0)
				{
					target = worldMap[xRef][yRef];
				}
			}
			
			return target;
		}
		
		public function addUnit(unit:Unit):void
		{
			this.units.push(unit);
			addChild(unit.getImage());
		}
		
		public function setUnits(units:Array):void
		{
			this.units = units;
			for each (var unit:Unit in units)
			{
				addChild(unit.getImage());
			}
		}
		
		public function setTerrainType(type:uint):void
		{
			removeChild(terrain.getImage());
			terrain = new Terrain(this, type);
			addChild(terrain.getImage());
		}
		
		public function getTerrain():Terrain
		{
			return terrain;
		}
		
		public function getTerrainType():uint
		{
			return terrain.getType();
		}
		
		public function getUnits():Array
		{
			return units;
		}
		
		public function getCords():Array
		{
			return [xRef, yRef];
		}
		
		public function getNeighbors():Array
		{
			return neighbors;
		}
	}
}