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
		private var map:Array;
		private var mapWidth:int;
		private var mapHeight:int;
		
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
			
			mapWidth = 10;
			mapHeight = 10;
		
			map = new Array
			
			for (var x:int = 0; x < mapWidth; x++)
			{
				for (var y:int = 0; y < mapHeight; y++)
				{
					map.push(1);
				}
			}
			draw();
			
			removeChild(this.getChildAt(0));
			setTile(4, 5, 0);
			draw();
		}
		
		private function draw():void
		{
			for (var i:int = 0; i < map.length; i++)
			{
				var image:Sprite = drawTile(map[i]);
				image.x = i % mapHeight * 16;
				image.y = Math.floor(i / mapHeight) * 16;
				addChild(image);
			}
		}
		
		private function setTile(x:int, y:int, type:int):void
		{
			map[y * mapHeight + x] = type;
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