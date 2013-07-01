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
	public class Player extends Ship
	{
		protected var leftDown:Boolean = false, upDown:Boolean = false, rightDown:Boolean = false, downDown:Boolean = false, spaceDown:Boolean = false, target:Enemy;
		
		public static var player:Player;
		
		public function Player(start:Point)
		{
			super(start, teamPlayer);
			if (player != null)
			{
				throw(new Error("Too many players"));
			}
			else
			{
				player = this;
			}
			
			mainRef.stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeysDown);
			mainRef.stage.addEventListener(KeyboardEvent.KEY_UP, checkKeysUp);
		}
		
		override protected function frame(event:Event):void
		{
			if (Enemy.enemys[0] is Enemy)
			{
				target = Enemy(findNearest(Entity(Enemy.enemys[0])));
			}
			
			if (leftDown)
			{
				tryMove(-1);
			}
			
			if (upDown)
			{
				tryMove(0, -1);
			}
			
			if (rightDown)
			{
				tryMove(1);
			}
			
			if (downDown)
			{
				tryMove(0, 1)
			}
			
			if (spaceDown)
			{
				fireAtPoint(new Point(x + center.x, y + center.y - 1), Entity.teamPlayer);
			}
			
			super.frame(event);
		}
		
		protected function checkKeysDown(event:KeyboardEvent):void
		{
			if (event.keyCode == 37 || event.keyCode == 65)
			{
				leftDown = true;
			}
			
			if (event.keyCode == 38 || event.keyCode == 87)
			{
				upDown = true;
			}
			
			if (event.keyCode == 39 || event.keyCode == 68)
			{
				rightDown = true;
			}
			
			if (event.keyCode == 40 || event.keyCode == 83)
			{
				downDown = true;
			}
			
			if (event.keyCode == 32)
			{
				spaceDown = true;
			}
		}
		
		protected function checkKeysUp(event:KeyboardEvent):void
		{
			if (event.keyCode == 37 || event.keyCode == 65)
			{
				leftDown = false;
			}
			
			if (event.keyCode == 38 || event.keyCode == 87)
			{
				upDown = false;
			}
			
			if (event.keyCode == 39 || event.keyCode == 68)
			{
				rightDown = false;
			}
			
			if (event.keyCode == 40 || event.keyCode == 83)
			{
				downDown = false;
			}
			
			if (event.keyCode == 32)
			{
				spaceDown = false;
			}
		}
		
		override public function remove():void
		{
			super.remove();
			mainRef.stage.removeEventListener(KeyboardEvent.KEY_DOWN, checkKeysDown);
			mainRef.stage.removeEventListener(KeyboardEvent.KEY_UP, checkKeysUp);
			player = null;
		}
		
		override protected function getImage():Bitmap
		{
			return new MediaLoader.ingamePlayer();
		}
		
		override protected function getStays():Array
		{
			return [true, true];
		}
		
		override protected function getFireRate():int
		{
			return 15;
		}
	}
}


