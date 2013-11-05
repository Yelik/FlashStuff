package  
{
	import flash.display.*;
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Image 
	{
		protected var image:Sprite;
		
		public function Image() 
		{
			
		}
		
		public function drawImage():Sprite 
		{
			return new Sprite();
		}
		
		public function setImage(image:Sprite = null):void 
		{
			this.image = image;
		}
		
		public function getImage():Sprite
		{
			if (this.image == null) {
				setImage(drawImage());
			}
			return image;
		}
	}
}