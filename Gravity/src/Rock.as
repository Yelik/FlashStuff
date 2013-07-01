package
{
	import flash.display.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Rock
	{
		private var location:Point, size:Number, direction:int, speed:Number, image:Sprite;
		
		public function Rock(location:Point, size:Number)
		{
			this.location = location;
			this.size = size;
			
			image = new Sprite();
			image.graphics.lineStyle(1);
			image.graphics.beginFill(0x888888);
			image.graphics.drawCircle(-size / 2, -size / 2, size);
			image.graphics.endFill();
			Main.i.addChild(image);
		}
		
		public function addMovement(direction:int, speed:Number):void
		{
			
		}
		
		public function setMovement(direction:int, speed:Number):void
		{
			
		}
		
		public function render():void
		{
			image.x = location.x;
			image.y = location.y;
			image.rotation = direction;
		}
	}
}