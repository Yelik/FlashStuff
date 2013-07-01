package com.mrizen.scrollingshooter.ingame
{
	import com.mrizen.scrollingshooter.*;
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class IngameControl extends SecondLevel
	{
		protected static var backgroundSpeed:int = 3, background:Sprite, back1:Bitmap, back2:Bitmap, back3:Bitmap, lastLevel:int = 0, currentLevel:Level, displayBar:IngameDisplayBar;
		
		public static var i:IngameControl, mainRef:Main, unloaded:Boolean;
		
		public function IngameControl()
		{
			i = this;
			
			background = new Sprite();
			back1 = new MediaLoader.ingameBack();
			back2 = new MediaLoader.ingameBack();
			back3 = new MediaLoader.ingameBack();
			back2.y = -back2.height;
			back3.y = back2.height;
			mainRef = FlowControl.mainRef
			Entity.mainRef = mainRef;
			displayBar = new IngameDisplayBar();
			background.addChild(back1);
			background.addChild(back2);
			background.addChild(back3);
			addChildAt(background, 0);
			addChild(displayBar)
			Level.makeLevels();
		}
		
		protected function frame(e:Event):void
		{
			FlowControl.upFPS();
			setChildIndex(displayBar, numChildren - 1);
			function b(back:Bitmap):Bitmap
			{
				back.y += backgroundSpeed;
				if (back.y >= mainRef.stage.stageHeight)
				{
					back.y = -back.height;
				}
				return back;
			}
			back1 = b(back1);
			back2 = b(back2);
			back3 = b(back3);
			
			if (Player.player == null)
			{
				playerDie();
			}
		}
		
		protected function nextLevel():void
		{
			startLevel(lastLevel + 1);
		}
		
		public static function playerDie():void
		{
			i.unload();
			FlowControl.loadMainMenu();
		}
		
		protected function startLevel(levelNumber:int):void
		{
			lastLevel = levelNumber;
			currentLevel = Level.getLevel(levelNumber);
			new Player(currentLevel.playerStart);
			currentLevel.spawning = true;
		}
		
		public function loadLevel(levelNumber:int = 0):void
		{
			load();
			if (levelNumber == 0)
			{
				nextLevel();
			}
			else
			{
				startLevel(levelNumber);
			}
		}
		
		public static function getPlayArea():Array
		{
			return [0, 0, mainRef.stage.stageWidth, mainRef.stage.stageHeight - displayBar.height];
		}
		
		override public function load():void
		{
			Level.makeLevels();
			addEventListener(Event.ENTER_FRAME, frame);
			unloaded = false;
			super.load();
		}
		
		override public function unload():void
		{
			removeEventListener(Event.ENTER_FRAME, frame);
			currentLevel.spawning = false;
			unloaded = true;
			super.unload();
		}
		
		override protected function getName():String
		{
			return "Ingame Control";
		}
	}
}


