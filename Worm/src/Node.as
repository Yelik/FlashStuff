package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Node extends Sprite
	{
		protected var image:Shape, size:int, target:Node;
		
		public function Node(target:Node)
		{
			this.target = target;
			size = target.size + 1;
			image = new Shape();
			addChild(image);
			drawImage();
			addEventListener(Event.ENTER_FRAME, frame);
		}
		
		protected function drawImage():void
		{
			image.graphics.clear();
			image.graphics.lineStyle(1);
			image.graphics.beginFill(0x307505);
			image.graphics.drawCircle(0, 0, size);
		}
		
		protected function moveTo(x:int, y:int):void
		{
			this.x = (x + this.x) / 2;
			this.y = (y + this.y) / 2;
		}
		
		protected function frame(e:Event):void
		{
			moveTo(target.x, target.y);
		}
	}

}