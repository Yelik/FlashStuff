package com.mrizen.scrollingshooter.ingame
{
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	public class Bullet extends Entity
	{
		protected var target:Point;
		
		public static var bullets:Array = [];
		
		public function Bullet(start:Point, target:Point, team:int)
		{
			super(start, team);
			this.target = target;
			var movement:Array = AdvMath.moveAtTarget(start, Point(target), accel);
			xSpeed = movement[0];
			ySpeed = movement[1];
			bullets.push(this);
		}
		
		override public function remove():void
		{
			bullets.splice(bullets.indexOf(this),1);
			super.remove();
		}
		
		override protected function frame(event:Event):void
		{
			super.frame(event);
			var theX:int = target.x - x;
			var theY:int = (target.y - y) * -1;
			var angle:Number = Math.atan(theY / theX) / (Math.PI / 180);
			if (theX < 0)
			{
				angle += 180;
			}
			if (theX >= 0 && theY < 0)
			{
				angle += 360;
			}
			rotation = (angle * -1) + 90;
		}
		
		override protected function getImage():Bitmap
		{
			return new MediaLoader.ingameBullet();
		}
		
		override protected function getMaxXSpeed():int
		{
			return 15;
		}
		
		override protected function getMaxYSpeed():int
		{
			return 15;
		}
		
		override protected function getAccel():Number
		{
			return 15;
		}
		
		override protected function hasFriction():Boolean
		{
			return false;
		}
		
		override protected function getStays():Array
		{
			return [false, false];
		}
		
		override protected function getDamage():int
		{
			return 3;
		}
		
		override protected function getFriction():Number
		{
			return 1;
		}
	}
}


