package
{
	import flash.display.*;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map extends Sprite
	{
		private var map:Bitmap, mapData:BitmapData;
		
		public function Map(main:Main, scale:Number)
		{
			scaleX = scale;
			scaleY = scale;
			mapData = new BitmapData(main.stage.stageWidth / scale, main.stage.stageHeight / scale, false, 0);
			map = new Bitmap(mapData);
			addChild(map);
		}
		
		public function generate(numberOfRooms:int, maxRoomSize:int):void
		{
			var start:Point = new Point(), end:Point = new Point(), current:Point = new Point(), rooms:Array = [], room:Room;
			while (rooms.length < numberOfRooms)
			{
				start.x = Math.floor(Math.random() * mapData.width);
				start.y = Math.floor(Math.random() * mapData.height);
				end.x = Math.floor(Math.random() * mapData.width);
				end.y = Math.floor(Math.random() * mapData.height);
				room = new Room(start, end);
				mapData.setPixel(start.x, start.y, 0x0000FF);
				mapData.setPixel(end.x, end.y, 0xFF0000);
				rooms.push(room);
			}
		}
		
		public function clear():void
		{
			for (var x:int = 0; x < mapData.width; x++)
			{
				for (var y:int = 0; y < mapData.height; y++)
				{
					mapData.setPixel(x, y, 0);
				}
			}
		}
	}
}