package com.mrizen.scrollingshooter.ingame
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class IngameDisplayBar extends Sprite
	{
		protected static var shieldPercent:Number, shieldLife:Sprite, shieldLifeBar:Sprite, shieldLifeWidth:int, shieldLifeHeight:int, player:Player;
		
		public var displayHeight:int;
		
		public function IngameDisplayBar()
		{
			displayHeight = 102;
			y = IngameControl.mainRef.stage.stageHeight - displayHeight;
			
			graphics.beginFill(0x000000);
			graphics.drawRect(0, 0, IngameControl.mainRef.stage.stageWidth, displayHeight);
			
			addEventListener(Event.ENTER_FRAME, frame);
			
			shieldLifeWidth = 100;
			shieldLifeHeight = 25;
			
			shieldLife = new Sprite();
			shieldLife.graphics.lineStyle(1, 0xFFFFFF);
			shieldLife.graphics.drawRect(0, 0, shieldLifeWidth, shieldLifeHeight);
			addChild(shieldLife);
			
			shieldLifeBar = new Sprite();
			shieldLife.addChild(shieldLifeBar);
		}
		
		protected function frame(e:Event):void
		{
			player = Player.player;
			if (player == null)
			{
				return
			}
			
			shieldPercent = player.shieldLife / player.maxShield;
			shieldLifeBar.graphics.clear();
			if (player.shieldLife >= player.minShield)
			{
				shieldLifeBar.graphics.beginFill(Player.player.shieldColor);
			}
			else
			{
				shieldLifeBar.graphics.beginFill(0xFF0000);
			}
			shieldLifeBar.graphics.drawRect(0, 1, shieldPercent * 100, shieldLifeHeight - 1);
		}
	}
}


