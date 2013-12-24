package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		public var dots:Vector.<Dot>;
		
		private var dotWidth:int;
		private var dotHeight:int;
		private var maxXOffset:int;
		private var maxYOffset:int;
		private var size:int;
		
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
			
			size = 1;
			dotWidth = 10;
			dotHeight = 10;
			maxXOffset = 16;
			maxYOffset = 16;
			
			dots = new Vector.<Dot>;
			
			for (var y:int = 0; y < dotHeight; y++)
			{
				for (var x:int = 0; x < dotWidth; x++)
				{
					addDot(x * stage.stageWidth / dotWidth + Math.floor(Math.random() * maxXOffset), y * stage.stageHeight / dotHeight + Math.floor(Math.random() * maxYOffset), x, y);
				}
			}
			
			for each (var dot:Dot in dots)
			{
				dot.findConnections();
				dot.draw();
			}
		}
		
		private function addDot(x:int, y:int, mapX:int, mapY:int):void
		{
			var dot:Dot = new Dot(this, x, y, size, mapX, mapY);
			dots.push(dot);
			addChild(dot);
		}
	}
}