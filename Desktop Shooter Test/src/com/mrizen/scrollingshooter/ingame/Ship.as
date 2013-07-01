package com.mrizen.scrollingshooter.ingame
{
	import com.mrizen.scrollingshooter.FlowControl;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Ship extends Entity
	{
		protected var fireRate:int, shootCooldown:int = 0, canShoot:Boolean = true, center:Point, moves:Array, shield:Sprite, shieldRegen:Number, bulletType:int;
		
		public var shieldLife:Number, maxShield:int, shieldColor:Number, minShield:Number;
		
		public function Ship(start:Point, team:int)
		{
			super(start, team);
			moves = [false, false, false, false]
			fireRate = getFireRate();
			center = new Point(image.width / 2, image.height / 2);
			shieldLife = getStartingShield();
			shield = new Sprite();
			shieldRegen = getShieldRegen();
			maxShield = getStartingShield();
			shieldColor = getShieldColor();
			minShield = getMinShield();
			bulletType = getBulletType();
			addChild(shield);
		}
		
		override protected function frame(event:Event):void
		{
			testForHits(Bullet.bullets);
			testForHits(Enemy.enemys);
			
			shield.graphics.clear();
			if (shieldLife >= minShield)
			{
				shield.graphics.lineStyle(1, shieldColor);
				shield.graphics.beginFill(shieldColor, 0.3);
				shield.graphics.drawCircle(image.width / 2, image.height / 2, ((image.width + image.height) / 2) + (shieldLife * 2));
			}
			
			if (shootCooldown > 0)
			{
				shootCooldown--;
			}
			else
			{
				canShoot = true;
			}
			
			if (moves[0])
			{
				xSpeed -= accel;
			}
			else if (moves[2])
			{
				xSpeed += accel;
			}
			
			if (moves[1])
			{
				ySpeed -= accel;
			}
			else if (moves[3])
			{
				ySpeed += accel;
			}
			
			moves = [false, false, false, false];
			
			shieldLife += shieldRegen;
			
			if (shieldLife > maxShield)
			{
				shieldLife = maxShield;
			}
			else if (shieldLife < 0)
			{
				shieldLife = 0;
			}
			
			super.frame(event);
		}
		
		protected function testForHits(a:Array):void
		{
			if (a != null)
			{
				for (var i:int = 1; i <= a.length; i++)
				{
					var t:Entity = a[i - 1];
					
					if (hitTestObject(t))
					{
						if (shieldLife >= minShield)
							shieldCollision(t);
						else
							collision(t);
					}
				}
			}
		}
		
		protected function collision(other:Entity):void
		{
			if (other.team != this.team)
			{
				other.remove();
				remove();
			}
		}
		
		protected function shieldCollision(other:Entity):void
		{
			if (other.team != this.team)
			{
				shieldLife -= other.damage;
				other.remove();
			}
		}
		
		protected function tryMove(xDir:int = 0, yDir:int = 0):void
		{
			if (xDir == -1)
			{
				moves[0] = true;
			}
			else if (xDir == 1)
			{
				moves[2] = true
			}
			
			if (yDir == -1)
			{
				moves[1] = true
			}
			else if (yDir == 1)
			{
				moves[3] = true;
			}
		}
		
		protected function fireAtPoint(target:Point, team:int):void
		{
			if (canShoot)
			{
				var b:Bullet = getNewBullet(new Point(x + center.x, y + center.y), team, bulletType, target);
				canShoot = false;
				shootCooldown = fireRate;
			}
		}
		
		protected function getNewBullet(start:Point, team:int, type:int, targetPoint:Point = null, target:Entity = null):Bullet
		{
			switch (type)
			{
				case 1:
					return new Bullet(start, targetPoint, team);
					break;
				
				default:
					throw(new Error("Invalid bullet Type"));
			}
		}
		
		protected function getFireRate():int
		{
			return 30;
		}
		
		protected function getStartingShield():Number
		{
			return 10;
		}
		
		protected function getShieldRegen():Number
		{
			return 0.1;
		}
		
		protected function getMinShield():Number
		{
			return 2.5;
		}
		
		protected function getShieldColor():Number
		{
			return 0x005555;
		}
		
		protected function getBulletType():int
		{
			return 1;
		}
		
		override protected function getMaxXSpeed():int
		{
			return 10;
		}
		
		override protected function getMaxYSpeed():int
		{
			return 10;
		}
		
		override protected function getAccel():Number
		{
			return 1;
		}
		
		override protected function hasFriction():Boolean
		{
			return true;
		}
		
		override protected function getStays():Array
		{
			return [true, false];
		}
		
		override protected function getFriction():Number
		{
			return 0.95;
		}
		
		override protected function getDamage():int
		{
			return 10;
		}
	}
}
