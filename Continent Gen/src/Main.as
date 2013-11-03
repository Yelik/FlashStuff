package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	[SWF(backgroundColor="0x000000")]
	public class Main extends Sprite
	{
		static public const TYPE_WATER:int = 0;
		private var map:Array, mapSize:int, mapDraw:Sprite, colors:Array, tileSize:int, buffer:int, contSize:int, contCount:int, curConts:int;
		
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
			
			//sets generator values
			mapSize = 20;
			buffer = 0;
			
			contSize = 10;
			contCount = 10;
			curConts = 0;
			
			colors = [0x000000];
			
			for (var i:int = 1; i <= contCount; i++)
			{
				colors.push(0xFFFFFF / i - 1 / 2);
			}
			
			//prep drawing
			mapDraw = new Sprite;
			addChild(mapDraw);
			
			//auto tile size
			if (stage.stageWidth < stage.stageHeight)
			{
				tileSize = stage.stageWidth / (mapSize + buffer);
			}
			else
			{
				tileSize = stage.stageHeight / (mapSize + buffer);
			}
			
			//make map size, only square maps
			map = [];
			for (i = 0; i < mapSize * mapSize; i++)
			{
				map.push(0);
			}
			
			//fill random
			/*
			   for (var i:int = 0; i < mapSize * mapSize; i++)
			   {
			   setAt(Math.random() * mapSize, Math.random() * mapSize, Math.random() * colors.length);
			   }
			 */
			
			//generates continents
			
			for (i = 0; i < colors.length; i++)
			{
				curConts++;
				var mapSave:Array = map.concat()
				if (!drawCont(Math.random() * mapSize, Math.random() * mapSize, contSize, curConts))
				{
					i--;
					curConts--;
					map = mapSave;
				}
			}
			
			//draw map
			drawMap();
			
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				redraw();
			}
		}
		
		private function redraw():void
		{
			removeChild(mapDraw);
			init();
		}
		
		private function drawCont(x:int, y:int, size:int, type:int):Boolean
		{
			if (getAt(x, y) || type == TYPE_WATER)
				return false;
			
			var point:Point, connect:Vector.<Point>;
			
			for (var i:int = 0; i < size; i++)
			{
				setAt(x, y, type);
				connect = getConnect(x, y);
				
				if (connect.length == 0)
					return false;
				
				point = connect[Math.floor(Math.random() * connect.length)];
				x = point.x;
				y = point.y;
			}
			
			return true;
		}
		
		private function findCont(x:int, y:int):Vector.<Point>
		{
			var cont:Vector.<Point> = new Vector.<Point>, i:int = 0, type:int = getAt(x, y);
			
			var p:Point, equal:Boolean, check:Vector.<Point>;
			
			cont.push(pnt(x, y));
			
			while (i < cont.length)
			{
				p = cont[i], check = new Vector.<Point>;
				;
				check.push(pnt(p.x - 1, p.y));
				check.push(pnt(p.x + 1, p.y));
				check.push(pnt(p.x, p.y - 1));
				check.push(pnt(p.x, p.y + 1));
				for (var i2:int = 0; i2 < check.length; i2++)
				{
					if (getAtP(check[i2]) == type)
					{
						equal = false;
						for (var i3:int = 0; i3 < cont.length; i3++)
						{
							if (check[i2].equals(cont[i3]))
							{
								equal = true;
							}
						}
						if (!equal)
						{
							cont.push(check[i2]);
						}
					}
				}
				
				i++;
			}
			return cont;
		}
		
		private function pnt(x:int, y:int):Point
		{
			return new Point(x, y);
		}
		
		private function getConnect(x:int, y:int):Vector.<Point>
		{
			var connects:Vector.<Point> = new Vector.<Point>, cont:Vector.<Point> = new Vector.<Point>, i:int = 0, check:Vector.<Point> = new Vector.<Point>, type:int = getAt(x, y);
			
			cont = findCont(x, y);
			
			while (i < cont.length)
			{
				var p:Point = cont[i];
				check.push(pnt(p.x - 1, p.y));
				check.push(pnt(p.x + 1, p.y));
				check.push(pnt(p.x, p.y - 1));
				check.push(pnt(p.x, p.y + 1));
				for (var i2:int = 0; i2 < check.length; i2++)
				{
					if (getAtP(check[i2]) == TYPE_WATER)
					{
						if (connects.length == 0)
						{
							connects.push(check[i2]);
						}
						for (var i3:int = 0; i3 < connects.length; i3++)
						{
							if (!check[i2].equals(connects[i3]))
							{
								connects.push(check[i2]);
							}
						}
					}
				}
				check = new Vector.<Point>;
				i++;
			}
			return connects;
		}
		
		private function drawMap():void
		{
			for (var x:int = 0; x < mapSize; x++)
			{
				for (var y:int = 0; y < mapSize; y++)
				{
					mapDraw.graphics.beginFill(colors[getAt(x, y)]);
					mapDraw.graphics.drawRect(x * (tileSize + buffer), y * (tileSize + buffer), tileSize, tileSize);
				}
			}
		}
		
		private function getAt(x:int, y:int):int
		{
			if (x < 0 || y < 0 || x >= mapSize || y >= mapSize)
			{
				return -1;
			}
			return map[y * mapSize + x];
		}
		
		private function getAtP(point:Point):int
		{
			return getAt(point.x, point.y);
		}
		
		private function setAt(x:int, y:int, val:int):void
		{
			if (x < 0 || y < 0 || x >= mapSize || y >= mapSize)
			{
				return;
			}
			map[y * mapSize + x] = val;
		}
	}
}