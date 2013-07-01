package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Tile extends Sprite
	{
		private var mapNumber:int, type:int, image:Bitmap, imageData:BitmapData;
		
		private static var images:Array;
		
		public function Tile(mapNumber:int, type:int)
		{
			this.mapNumber = mapNumber;
			this.type = type;
		}
		
		public static function prepareStatic():void
		{
			images = [];
		}
		
		public function getType():int
		{
			return type;
		}
	}
}