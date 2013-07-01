package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Dot extends Bitmap
	{
		private var leader:Dot, data:BitmapData, minDist:Number, dist:Number, speed:Array;
		
		public function Dot()
		{
			data = new BitmapData(Entity.ZOOM, Entity.ZOOM, false, 0);
			this.bitmapData = data;
			speed = [0, 0];
			minDist = Entity.ZOOM + 1;
			addEventListener(Event.ENTER_FRAME, frame);
		}
		
		protected function frame(e:Event = null):void
		{
			if (leader != null)
			{
				dist = AdvMath.distance(x, y, leader.x, leader.y);
				if (dist > minDist)
					speed = AdvMath.moveAtTarget([x, y], [leader.x, leader.y], Entity.ZOOM);
			}
			x += speed[0];
			y += speed[1];
			setColor(x * 100);
		}
		
		public function setMotion(x:int, y:int):void
		{
			speed[0] = x;
			speed[1] = y;
		}
		
		public function setLeader(leader:Dot):void
		{
			this.leader = leader;
		}
		
		public function setColor(color:int):void
		{
			for (var x:int = 0; x < data.width; x++) 
			{
				for (var y:int = 0; y < data.height; y++) 
				{
					data.setPixel(x, y, color);
				}
			}
		}
	}
}