package com.mrizen.scrollingshooter
{
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class MainMenu extends SecondLevel
	{
		protected static var back:Bitmap, play:Sprite, help:Sprite, playImage:Bitmap, helpImage:Bitmap;
		
		public function MainMenu()
		{
			back = new MediaLoader.mainmenuBack();
			playImage = new MediaLoader.mainmenuPlay();
			helpImage = new MediaLoader.mainmenuHelp();
			
			play = new Sprite();
			help = new Sprite();
			
			back.x = FlowControl.mainRef.stage.stageWidth / 2 - back.width / 2;
			play.x = back.x;
			help.x = back.x;
			
			play.y = back.y + back.height;
			help.y = play.y + playImage.height;
			
			play.addChild(playImage);
			help.addChild(helpImage);
			
			addChild(back);
			addChild(play);
			addChild(help);
			
			play.addEventListener(MouseEvent.CLICK, playClicked);
			help.addEventListener(MouseEvent.CLICK, helpClicked);
		}
		
		protected function helpClicked(e:MouseEvent):void
		{
			unload();
			FlowControl.loadHelp();
		}
		
		protected function playClicked(e:MouseEvent):void
		{
			unload();
			FlowControl.loadLevelMenu();
		}

		override protected function getName():String
		{
			return "Main Menu";
		}
	}
}

