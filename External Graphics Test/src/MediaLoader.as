package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class MediaLoader extends Sprite
	{
		private var loader:Sprite, loaderBar:Shape, loaderWidth:int, loaderHeight:int, imageLocations:Array;
		
		public static var images:Array;
		
		public function MediaLoader()
		{
			imageLocations = [];
			
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			loader = new Sprite();
			loaderBar = new Shape();
			loaderWidth = 100;
			loaderHeight = 25;
			loader.x = stage.stageWidth / 2 - loaderWidth / 2;
			loader.y = stage.stageHeight / 2 - loaderHeight / 2;
			loader.graphics.lineStyle(1);
			loader.graphics.drawRect(0, 0, loaderWidth, loaderHeight);
			loader.addChild(loaderBar);
			addChild(loader);
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void
		{
			var percent:Number = e.bytesLoaded / e.bytesTotal;
			trace(percent, e.bytesLoaded, e.bytesTotal);
			loaderBar.graphics.clear();
			loaderBar.graphics.beginFill(0x000000);
			loaderBar.graphics.drawRect(0, 0, loaderWidth * percent, loaderHeight);
		}
		
		private function loadingFinished():void
		{
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			removeChild(loader);
			
			Main.i.doneLoading();
		}
	}
}

