package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var map:Array
		
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
			
			var width:int = 10;
			var height:int = 10;
			
			map = new Array
			
			for (var x:int = 0; x < width; x++)
			{
				for (var y:int = 0; y < height; y++)
				{
					map.push(1);
				}
			}
			draw();
		}
		
		private function draw():void
		{
			for (var i:int = 0; i < map.length; i++)
			{
				var image:Sprite = drawTile(map[i]);
				image.x = i % Math.sqrt(map.length) * 16;
				image.y = Math.floor(i / Math.sqrt(map.length)) * 16;
				addChild(image);
			}
		}
		
		private function setTile(x:int, y:int, type:int):void
		{
			
		}
		
		private function drawTile(type:int):Sprite
		{
			var image:Sprite = new Sprite, width:int = 16, height:int = 16;
			switch (type)
			{
				case 1: 
					image.graphics.lineStyle(1);
					image.graphics.beginFill(0x784800);
					image.graphics.drawRect(0, 0, width, height)
			}
			return image;
		}
	}

}