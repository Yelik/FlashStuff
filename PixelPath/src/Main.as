package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private var bit:Bitmap, map:BitmapData, p:Point, color:ColorTransform, range:int, change:Vector.<int>;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			map = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0xFFFFFF);
			bit = new Bitmap(map);
			addChild(bit);
			
			p = new Point(randInFl(0, map.width), randInFl(0, map.height));
			
			range = 1;
			
			color = new ColorTransform();
			color.redOffset = color.greenOffset = color.blueOffset = 0;
			
			change = new Vector.<int>;
			change.push(randIn(-range, range), randIn(-range, range), randIn(-range, range));
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			map.setPixel(p.x, p.y, color.color);
			p.x += randInRd(-1, 1);
			p.y += randInRd(-1, 1);
			p.x = containInt(p.x, map.width);
			p.y = containInt(p.y, map.height);
			for (var i:int = 0; i < change.length; i++)
			{
				change[i] = randInRd(-range, range);
				change[i] = containInt(change[i], 0xFF);
			}
			color.redOffset += change[0];
			color.greenOffset += change[1];
			color.blueOffset += change[2];
			color.redOffset = containInt(color.redOffset, 0xFF);
			color.greenOffset = containInt(color.greenOffset, 0xFF);
			color.blueOffset = containInt(color.blueOffset, 0xFF);
		}
		
		private function containInt(num:int, high:int, low:int = 0):int
		{
			while (num < low)
			{
				num += high;
			}
			while (num > high)
			{
				num -= high;
			}
			return num;
		}
		
		private function randIn(low:Number, high:Number):Number
		{
			return Math.random() * (high - low) + low;
		}
		
		private function randInFl(low:int, high:int):int
		{
			return Math.floor(randIn(low, high));
		}
		
		private function randInRd(low:int, high:int):int
		{
			return Math.round(randIn(low, high));
		}
	}
}