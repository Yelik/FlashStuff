package com.mrizen.minotaur
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class Unit extends Sprite
	{
		protected var index:uint;
		
		protected var image:Bitmap;
		protected var imageContainer:Sprite;
		protected var imagePoint:Point;
		
		protected var currentTile:Tile;
		protected var targetTile:Tile;
		
		protected var smell:uint;
		protected var strength:uint;
		
		protected var turnOver:Boolean;
		protected var dead:Boolean;
		
		public function Unit(currentTile:Tile, index:uint)
		{
			this.currentTile = currentTile;
			this.index = index;
			basePrep();
			addEventListener(Event.ENTER_FRAME, prep);
		}
		
		protected function basePrep():void
		{
			image = new Bitmap();
			smell = 1;
		}
		
		protected function prep(e:Event):void
		{
			if (currentTile.getReady())
			{
				dead = false;
				currentTile.setOccupant(this);
				imageContainer = new Sprite();
				imageContainer.addChild(image);
				addChild(imageContainer);
				draw();
				removeEventListener(Event.ENTER_FRAME, prep);
			}
		}
		
		public function startMyTurn():void
		{
			if (currentTile.getHurts())
			{
				strength--;
			}
			if (currentTile.getKills())
			{
				strength = 0;
			}
			if (strength == 0)
			{
				die();
				turnOver = true;
			}
			addEventListener(Event.ENTER_FRAME, myTurn);
		}
		
		protected function myTurn(e:Event):void
		{
			if (turnOver)
			{
				turnOver = false;
				removeEventListener(Event.ENTER_FRAME, myTurn);
				FlowControl.nextTurn();
			}
		}
		
		protected function draw():void
		{
			imagePoint = currentTile.getPoint();
			imageContainer.x = imagePoint.x;
			imageContainer.y = imagePoint.y;
		}
		
		public function setCurrentTile(tile:Tile, notify:Boolean):void
		{
			targetTile = tile;
			move(notify);
		}
		
		protected function move(notify:Boolean):void
		{
			if (targetTile is Tile)
			{
				if (targetTile.getOccupant() is Unit)
				{
					fight(this, targetTile.getOccupant());
				}
				if (targetTile is Tile)
				{
					currentTile.setOccupant(null);
					currentTile = targetTile;
					targetTile = null;
					currentTile.setOccupant(this);
					currentTile.findSmell();
					if (notify)
					{
						currentTile.onEnter(this);
					}
					draw();
				}
			}
		}
		
		protected function moveInstant(notify:Boolean):void
		{
			if (targetTile is Tile)
			{
				if (targetTile.getOccupant() is Unit)
				{
					fight(this, targetTile.getOccupant());
				}
				if (targetTile is Tile)
				{
					currentTile.setOccupant(null);
					currentTile = targetTile;
					targetTile = null;
					currentTile.setOccupant(this);
					currentTile.findSmell();
					if (notify)
					{
						currentTile.onEnter(this);
					}
					draw();
				}
			}
		}
		
		protected function fight(one:Unit, two:Unit):void
		{
			if (one.getStrength() < two.getStrength())
			{
				one.die();
			}
			else if (two.getStrength() < one.getStrength())
			{
				two.die();
			}
			else if (two.getStrength() == one.getStrength())
			{
				targetTile = null;
			}
		}
		
		public function die():void
		{
			if (!dead)
			{
				dead = true;
				FlowControl.kill(this);
			}
		}
		
		public function setIndex(value:int, relitive:Boolean):void
		{
			if (relitive)
			{
				index += value;
			}
			else
			{
				index = value;
			}
		}
		
		public function getTile():Tile
		{
			return currentTile;
		}
		
		public function getStrength():uint
		{
			return strength;
		}
		
		public function getSmell():uint
		{
			return smell;
		}
		
		public function getIndex():uint
		{
			return index;
		}
	}
}