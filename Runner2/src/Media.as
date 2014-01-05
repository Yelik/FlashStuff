package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Media extends Loader
	{
		private var loader:MediaLoader;
		private var index:int;
		
		public function Media(loader:MediaLoader, url:String, index:int)
		{
			this.index = index;
			this.loader = loader;
			load(new URLRequest(url));
			contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
		}
		
		private function progress(e:ProgressEvent):void
		{
			trace(e.bytesLoaded + " / " + e.bytesTotal);
		}
		
		private function complete(e:Event):void
		{
			this.loader.setImage(index, Bitmap(content).bitmapData);
		}
	}
}