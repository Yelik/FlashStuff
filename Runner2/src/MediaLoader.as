package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class MediaLoader
	{
		private var main:Main;
		private var images:Vector.<BitmapData>;
		private var loading:Vector.<Boolean>;
		
		public function MediaLoader(main:Main, maxImages:int)
		{
			this.main = main;
			images = new Vector.<BitmapData>
			loading = new Vector.<Boolean>
			for (var i:int = 0; i < maxImages; i++)
			{
				images.push(null);
				loading.push(true);
			}
		}
		
		public function load(url:String, index:int):void
		{
			var media:Media = new Media(this, url, index);
			loading[index] = false;
		}
		
		public function getImage(index:int):Bitmap
		{
			return new Bitmap(images[index]);
		}
		
		public function setImage(index:int, image:BitmapData):void
		{
			images[index] = image;
			loading[index] = true;
			if (isDoneLoading())
				main.doneLoading();
		}
		
		public function isDoneLoading():Boolean
		{
			for (var i:int = 0; i < loading.length; i++)
			{
				if (!loading[i])
				{
					return false;
				}
			}
			return true;
		}
	}
}