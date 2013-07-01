package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Preloader extends Sprite
	{
		private var loader:Loader, urls:Array, currentUrl:int, currentBytes:int, currentBytes2:int, totalBytes:int;
		
		public var images:Array;
		
		public function Preloader()
		{
			urls = [];
			images = [];
			loader = new Loader();
			currentUrl = 0;
			currentBytes = 0;
			totalBytes = 0;
		}
		
		public function loadImage(url:String):int
		{
			urls.push(url);
			load();
			return urls.indexOf(url);
		}
		
		public function loadImages(urls:Array):Array
		{
			this.urls = this.urls.concat(urls);
			load();
			var a:Array = [];
			for each(var s:String in urls)
			{
				a.push(this.urls.indexOf(s));
			}
			return a;
		}
		
		public function load():void
		{
			if (currentUrl == urls.length)
			{
				Main.i.donePreloading();
				return;
			}
			loader.load(new URLRequest(urls[currentUrl]));
			currentUrl++;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderDone);
		}
		
		private function loaderDone(e:Event):void
		{
			images.push(Bitmap(loader.content).bitmapData.clone());
			loader.unload();
			load();
		}
	}
}