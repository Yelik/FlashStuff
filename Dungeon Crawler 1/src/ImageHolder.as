package  
{
	import flash.display.*;
	/**
	 * ...
	 * @author Yelik
	 */
	public class ImageHolder 
	{
		private var preloader:Preloader, images:Array, names:Array;
		
		public function ImageHolder() 
		{
			preloader = Main.preloader;
			images = [];
			names = [];
		}
		
		public function addImage(index:int, name:String):void
		{
			var i:int = Main.getUniqueNumber(1);
			images[i] = preloader.images[index];
			names[i] = name;
		}
		
		public function getImage(name:String):BitmapData
		{
			trace(names.indexOf(name), images[names.indexOf(name)], images);
			return images[names.indexOf(name)];
		}
	}
}