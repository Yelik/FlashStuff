package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Preloader extends Sprite
	{
		private var loader:Sprite, loaderWidth:int, loaderHeight:int, loaderBar:Shape;
		
		public function Preloader()
		{
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
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			var percent:Number = e.bytesLoaded / e.bytesTotal;
			trace(percent, e.bytesLoaded, e.bytesTotal);
			loaderBar.graphics.clear();
			loaderBar.graphics.beginFill(0x000000);
			loaderBar.graphics.drawRect(0, 0, loaderWidth * percent, loaderHeight);
		}
		
		private function checkFrame(e:Event):void
		{
			if (currentFrame == totalFrames)
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			removeChild(loader);
			
			startup();
		}
		
		private function startup():void
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
	}
}

