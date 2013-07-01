package
{
	import flash.display.*;
	import flash.events.*;
	import flash.system.*;
	import flash.text.*;
	import flash.ui.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var i:Main, mainMenu:Sprite, game:Game;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			i = this;
			addChild(new FPSCounter(0, 0, 0));
			showMainMenu();
		}
		
		public function showMainMenu():void
		{
			mainMenu = new Sprite();
			var txt:TextField = new TextField(), play:Sprite = new Sprite(), playTxt:TextField = new TextField();
			
			txt.text = "Main Menu";
			txt.x = stage.stageWidth / 2 - txt.width / 2;
			mainMenu.addChild(txt);
			
			playTxt.text = "Play";
			playTxt.x = stage.stageWidth / 2 - playTxt.width / 2;
			play.y = txt.y + txt.height;
			play.addChild(playTxt);
			play.addEventListener(MouseEvent.CLICK, playClicked);
			mainMenu.addChild(play);
			
			addChild(mainMenu);
		}
		
		private function playClicked(e:MouseEvent):void
		{
			hideMainMenu();
			startGame();
		}
		
		public function hideMainMenu():void
		{
			removeChild(mainMenu);
			mainMenu = null;
		}
		
		public function startGame():void
		{
			game = new Game();
			addChild(game);
			game.start();
		}
		
		public function endGame():void
		{
			if (game.parent != null)
				game.parent.removeChild(game);
			game = null;
			showMainMenu();
			System.gc();
		}
	}
}