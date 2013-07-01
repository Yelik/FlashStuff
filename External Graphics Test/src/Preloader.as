package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Preloader extends MovieClip
	{
		private var loader:Sprite, loaderBar:Shape, loaderWidth:int, loaderHeight:int;
		
		public function Preloader()
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
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
