package com.mrizen.scrollingshooter.ingame
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity extends Sprite
	{
		protected var friction:Number, accel:Number, xSpeedMax:int, ySpeedMax:int, staysHorizontal:Boolean, staysVertical:Boolean;
		
		public var team:int, xSpeed:Number = 0, ySpeed:Number = 0, damage:int, image:Bitmap;
		
		public static var mainRef:Main;
		
		protected static const error:Error = new Error("Unoverriden methoid called", 6942);
		
		public static const teamPlayer:int = 1, teamEnemy:int = 2;
		
		public function Entity(start:Point, team:int)
		{
			this.team = team;
			x = start.x;
			y = start.y;
			addEventListener(Event.ENTER_FRAME, frame);
			image = getImage();
			xSpeedMax = getMaxXSpeed();
			ySpeedMax = getMaxYSpeed();
			accel = getAccel();
			staysHorizontal = getStays()[0];
			staysVertical = getStays()[1];
			damage = getDamage();
			friction = getFriction();
			addChild(image);
			IngameControl.i.addChild(this);
		}
		
		protected function frame(event:Event):void
		{
			if (IngameControl.unloaded && parent != null)
			{
				remove();
			}
			
			if (hasFriction())
			{
				xSpeed *= friction;
				ySpeed *= friction;
			}
			
			if (xSpeed > xSpeedMax)
			{
				xSpeed = xSpeedMax;
			}
			else if (xSpeed < -xSpeedMax)
			{
				xSpeed = -xSpeedMax;
			}
			if (ySpeed > ySpeedMax)
			{
				ySpeed = ySpeedMax;
			}
			else if (ySpeed < -ySpeedMax)
			{
				ySpeed = -ySpeedMax;
			}
			
			x += xSpeed;
			y += ySpeed;
			
			if (staysHorizontal)
			{
				if (x <= IngameControl.getPlayArea()[0])
				{
					x = IngameControl.getPlayArea()[0];
				}
				
				if (x >= IngameControl.getPlayArea()[2] - image.width)
				{
					x = IngameControl.getPlayArea()[2] - image.width;
				}
			}
			else
			{
				if (x < -1 * width)
				{
					remove();
				}
				else if (x > IngameControl.getPlayArea()[2] + width)
				{
					remove();
				}
			}
			if (staysVertical)
			{
				if (y <= IngameControl.getPlayArea()[1])
				{
					y = IngameControl.getPlayArea()[1];
				}
				
				if (y >= IngameControl.getPlayArea()[3] - image.height)
				{
					y = IngameControl.getPlayArea()[3] - image.height;
				}
			}
			else
			{
				if (this.y < -1 * height)
				{
					remove();
				}
				else if (this.y > IngameControl.getPlayArea()[3] + height)
				{
					remove();
				}
			}
		}
		
		public function remove():void
		{
			if (parent == IngameControl.i)
				IngameControl.i.removeChild(this);
			removeEventListener(Event.ENTER_FRAME, frame);
		}
		
		protected function findNearest(type:Entity):Entity
		{
			var savedE:Entity;
			var c:* = getClass(type);
			var es:Array;
			if (c == Enemy)
			{
				es = Enemy.enemys;
			}
			else if (c is Bullet)
			{
				
			}
			for each (var e2:Entity in es)
			{
				if (savedE == null)
				{
					savedE = e2;
				}
				if (getDistance(e2) < savedE.getDistance(e2))
				{
					savedE = e2;
				}
			}
			return savedE;
		}
		
		protected function getDistance(to:Entity):Number
		{
			return Math.sqrt(Math.abs(to.x - x) + Math.abs(to.y - y));
		}
		
		public function getClass(obj:*):*
		{
			return Class(getDefinitionByName(getQualifiedClassName(obj)));
		}
		
		protected function hasFriction():Boolean
		{
			throw(error);
			return null;
		}
		
		protected function getImage():Bitmap
		{
			throw(error);
			return null;
		}
		
		protected function getMaxXSpeed():int
		{
			throw(error);
			return 0;
		}
		
		protected function getMaxYSpeed():int
		{
			throw(error);
			return 0;
		}
		
		protected function getAccel():Number
		{
			throw(error);
			return 0;
		}
		
		protected function getStays():Array
		{
			throw(error);
			return [null, null];
		}
		
		protected function getFriction():Number
		{
			throw(error);
			return 0;
		}
		
		protected function getDamage():int
		{
			throw(error);
			return 0;
		}
	}
}


