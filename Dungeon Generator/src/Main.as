package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var image:Bitmap;
		private var map:BitmapData;
		private var center:Array;
		private var rooms:Vector.<Vector.<Array>>
		
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
			map = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0);
			image = new Bitmap(map);
			center = [stage.stageWidth / 2, stage.stageHeight / 2];
			rooms = new Vector.<Vector.<Array>>;
			rooms.push(new Vector.<Array>)
			rooms[0].push(center);
			for (var i:int = 0; i < 10000000; i++)
			{
				growRoom(0);
			}
			for each (var room:Vector.<Array>in rooms)
			{
				for each (var tile:Array in room)
				{
					map.setPixel(tile[0], tile[1], map.getPixel(tile[0], tile[1]) + 0x0f0000);
				}
			}
			addChild(image);
		}
		
		private function growRoom(roomNumber:int):void
		{
			var i:int = rooms[roomNumber].length - 1;
			var xPlus:int = 0;
			var yPlus:int = 0;
			while (xPlus == 0 && yPlus == 0)
			{
				xPlus = Math.round(Math.random() * 2 - 1);
				yPlus = Math.round(Math.random() * 2 - 1);
			}
			rooms[roomNumber].push([rooms[roomNumber][i][0] + xPlus, rooms[roomNumber][i][1] + yPlus]);
		}
	}
}