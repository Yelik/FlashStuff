package com.mrizen.minotaur
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class Tile extends Sprite
	{
		protected var yRef:uint;
		protected var xRef:uint;
		protected var type:uint;
		protected var levelNumber:uint;
		
		protected var ready:Boolean;
		protected var occupant:Unit;
		
		protected var tileImage:Bitmap;
		protected var tileImageCords:Point;
		protected var imageSize:uint;
		
		protected var walkable:Boolean;
		protected var hurts:Boolean;
		protected var kills:Boolean;
		
		protected var smell:uint;
		protected var smellAge:uint;
		
		public static const typeFloor:uint = 0;
		public static const typeWall:uint = 1;
		public static const typeStart:uint = 2;
		public static const typeEnd:uint = 3;
		public static const typeFire:uint = 4;
		public static const typeSpike:uint = 5;
		public static const typePortal:uint = 6;
		
		public function Tile(yRef:uint, xRef:uint, type:uint, levelNumber:uint)
		{
			this.yRef = yRef;
			this.xRef = xRef;
			this.type = type;
			this.levelNumber = levelNumber;
			ready = false;
			addEventListener(Event.ENTER_FRAME, prep);
		}
		
		protected function prep(e:Event):void
		{
			if (ready == true)
			{
				imageSize = 64;
				tileImage = new Bitmap();
				draw();
				setBehavior();
				removeEventListener(Event.ENTER_FRAME, prep);
			}
		}
		
		protected function setBehavior():void
		{
			if (type == typeStart || type == typeEnd || type == typeFloor || type == typeFire || type == typeSpike || type == typePortal)
			{
				walkable = true;
			}
			if (type == typeFire)
			{
				hurts = true;
			}
			if (type == typeSpike)
			{
				kills = true;
			}
		}
		
		protected function draw():void
		{
			tileImageCords = new Point(xRef * imageSize, yRef * imageSize);
			if (type == Tile.typeFloor)
			{
				if (Math.floor(Math.random() * 2) == 0)
				{
					tileImage = new MediaLoader.TileFloor();
				}
				else
				{
					tileImage = new MediaLoader.TileFloor2();
				}
			}
			else if (type == Tile.typeWall)
			{
				tileImage = new MediaLoader.TileWall();
			}
			else if (type == Tile.typeStart)
			{
				tileImage = new MediaLoader.TileStart();
			}
			else if (type == Tile.typeEnd)
			{
				tileImage = new MediaLoader.TileEnd();
			}
			tileImage.x = tileImageCords.x;
			tileImage.y = tileImageCords.y;
			addChild(tileImage);
		}
		
		public function onEnter(unit:Unit):void
		{
		
		}
		
		protected function findNeighbors(xRef:uint, yRef:uint, level:Array, levelInfo:Array):Array
		{
			var neighbors:Array = new Array();
			
			neighbors.push(findTileAt(xRef + 1, yRef, levelNumber));
			neighbors.push(findTileAt(xRef, yRef + 1, levelNumber));
			neighbors.push(findTileAt(xRef - 1, yRef, levelNumber));
			neighbors.push(findTileAt(xRef, yRef - 1, levelNumber));
			
			return neighbors;
		}
		
		protected function findTileAt(xRef:uint, yRef:uint, levelNumber:uint):Tile
		{
			var target:Tile;
			
			target = MapLoader.getLevel(levelNumber)[yRef * MapLoader.getLevelInfo(levelNumber)[1] + xRef];
			
			return target;
		}
		
		public function findSmell():void
		{
			smell = occupant.getSmell();
			smellAge = 0;
		}
		
		public function ageSmell():void
		{
			smellAge++;
		}
		
		public function setReady(value:Boolean):void
		{
			ready = value;
		}
		
		public function setSmellAge(value:uint, relitive:Boolean):void
		{
			if (relitive)
			{
				smellAge += value;
			}
			else
			{
				smellAge = value;
			}
		}
		
		public function setOccupant(unit:Unit):void
		{
			occupant = unit;
		}
		
		public function getOccupant():Unit
		{
			return occupant;
		}
		
		public function getLevelNumber():uint
		{
			return levelNumber;
		}
		
		public function getNeighbors():Array
		{
			return [getNeighbor("up"), getNeighbor("left"), getNeighbor("down"), getNeighbor("right")];
		}
		
		public function getNeighbor(direction:String):Tile
		{
			var neighbor:Tile;
			
			if (direction == "up")
			{
				neighbor = findTileAt(xRef, yRef - 1, levelNumber);
			}
			else if (direction == "left")
			{
				neighbor = findTileAt(xRef - 1, yRef, levelNumber);
			}
			else if (direction == "down")
			{
				neighbor = findTileAt(xRef, yRef + 1, levelNumber);
			}
			else if (direction == "right")
			{
				neighbor = findTileAt(xRef + 1, yRef, levelNumber);
			}
			
			return neighbor;
		}
		
		public function getPoint():Point
		{
			return tileImageCords;
		}
		
		public function getKills():Boolean
		{
			return kills;
		}
		
		public function getHurts():Boolean
		{
			return hurts;
		}
		
		public function getWalkable():Boolean
		{
			return walkable;
		}
		
		public function getType():uint
		{
			return type;
		}
		
		public function getReady():Boolean
		{
			return ready;
		}
		
		public function getImageSize():uint
		{
			return imageSize;
		}
		
		public function getSmell():uint
		{
			return smell;
		}
		
		public function getSmellAge():uint
		{
			return smellAge;
		}
	}
}