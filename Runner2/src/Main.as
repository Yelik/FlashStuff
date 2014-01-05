package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var mediaLoader:MediaLoader;
		private var fps:FPSCounter;
		private static var id:int = 0;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public static function getID():int
		{
			return id++;
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			fps = new FPSCounter(0, 0, 0, true, 0xFFFFFF);
			addChild(fps);
			
			mediaLoader = new MediaLoader(this, 100);
			mediaLoader.load("http://i.imgur.com/42KTiNf.png", Player.IDLE);
			mediaLoader.load("http://i.imgur.com/ZwmI13x.png", Player.RUNNING1);
			mediaLoader.load("http://i.imgur.com/n2R874Z.png", Player.RUNNING2);
		}

		
		public function doneLoading():void
		{
			var player:Player = new Player(this, 0, 0);
			addChild(player);
		}
		
		public function getImage(index:int):Bitmap
		{
			return mediaLoader.getImage(index);
		}
	}
}