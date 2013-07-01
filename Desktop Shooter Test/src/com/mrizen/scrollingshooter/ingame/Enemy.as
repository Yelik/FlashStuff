package com.mrizen.scrollingshooter.ingame
{
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Enemy extends Ship
	{
		protected var commands:Array, type:int;
		
		public static var enemys:Array = [], typeNormal:Array = [1, 10, 1, 60, 10, 10, 1, 0.95, 0, 0, 0xFF005555], typeShooter:Array = [2, 10, 1, 5, 3, 3, 1, 0.95, 5, 0, 0,0xFF005555];
		
		public static const types:Array = [typeNormal, typeShooter];
		
		public function Enemy(start:Point, type:int, commands:Array)
		{
			this.type = type;
			super(start, Entity.teamEnemy);
			enemys.push(this);
			this.commands = commands.concat();
		}
		
		override protected function frame(event:Event):void
		{
			var current:int = commands.shift();
			commands.push(current);
			
			switch (current)
			{
				case 0:
					break;
				
				case 1:
					tryMove(-1, 0);
					break;
				
				case 2:
					tryMove(-1, -1);
					break;
				
				case 3:
					tryMove(0, -1);
					break;
				
				case 4:
					tryMove(1, -1);
					break;
				
				case 5:
					tryMove(1, 0);
					break;
				
				case 6:
					tryMove(1, 1);
					break;
				
				case 7:
					tryMove(0, 1);
					break;
				
				case 8:
					tryMove(-1, 1);
					break;
				
				case-1:
					fireAtPoint(new Point(x + center.x - 1, y + center.y), teamEnemy);
					break;
				
				case-2:
					fireAtPoint(new Point(x + center.x - 1, y + center.y - 1), teamEnemy);
					break;
				
				case-3:
					fireAtPoint(new Point(x + center.x, y + center.y - 1), teamEnemy);
					break;
				
				case-4:
					fireAtPoint(new Point(x + center.x + 1, y + center.y - 1), teamEnemy);
					break;
				
				case-5:
					fireAtPoint(new Point(x + center.x + 1, y + center.y), teamEnemy);
					break;
				
				case-6:
					fireAtPoint(new Point(x + center.x + 1, y + center.y + 1), teamEnemy);
					break;
				
				case-7:
					fireAtPoint(new Point(x + center.x, y + center.y + 1), teamEnemy);
					break;
				
				case-8:
					fireAtPoint(new Point(x + center.x - 1, y + center.y + 1), teamEnemy);
					break;
			}
			
			super.frame(event);
		}
		
		override protected function getDamage():int
		{
			return types[type - 1][1];
		}
		
		override protected function getBulletType():int
		{
			return types[type - 1][2];
		}
		
		override protected function getFireRate():int
		{
			return types[type - 1][3];
		}
		
		override protected function getMaxXSpeed():int
		{
			return types[type - 1][4];
		}
		
		override protected function getMaxYSpeed():int
		{
			return types[type - 1][5];
		}
		
		override protected function getAccel():Number
		{
			return types[type - 1][6];
		}
		
		override protected function getFriction():Number
		{
			return types[type - 1][7];
		}

		override protected function getStartingShield():Number
		{
			return types[type - 1][8];
		}
				
		override protected function getShieldRegen():Number
		{
			return types[type - 1][9];
		}
		
		override protected function getMinShield():Number
		{
			return types[type - 1][10];
		}
		
		override protected function getShieldColor():Number
		{
			return types[type - 1][11];
		}
		
		override public function remove():void
		{
			super.remove();
			enemys.splice(enemys.indexOf(this), 1);
		}
		
		override protected function getImage():Bitmap
		{
			switch(types[type - 1][0])
			{
				case 1:
					return new MediaLoader.ingameEnemy1();
					break;
					
				case 2:
					return new MediaLoader.ingameEnemy2();
					break;
					
				default:
					throw(new Error("Invalid Image Type"));
			}
		}
	}
}


