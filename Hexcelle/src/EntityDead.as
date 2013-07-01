package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class EntityDead extends Entity
	{
		public var bit:Bitmap;
		
		public function EntityDead(x:int, y:int, bitData:BitmapData)
		{
			super(x, y);
			bit = new Bitmap(bitData);
			bit.x = -bit.bitmapData.width / 2;
			bit.y = -bit.bitmapData.height / 2;
			image.addChild(bit);
		}
	}
}