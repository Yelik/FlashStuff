package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Game
	{
		static public const GAME_ZERO:int = 0;
		static public const GAME_ONE:int = 1;
		
		private var map:Vector.<Tile>;
		private var mapSize:Array;
		private var screen:Sprite;
		private var main:Main;
		private var bufferWidth:int;
		private var bufferColor:int;
		private var regs:Vector.<Reg>
		
		public function Game(main:Main, map:Vector.<Tile>, mapWidth:int, bufferColor:int = 0, bufferWidth:int = 1)
		{
			setBuffer(bufferWidth, bufferColor);
			setMain(main);
			setMap(map);
			setRegs(new Vector.<Reg>);
			setMapSize([mapWidth, map.length / mapWidth]);
		}
		
		private function setRegs(regs:Vector.<Reg>):void
		{
			this.regs = regs;
		}
		
		public function getRegs():Vector.<Reg>
		{
			return regs
		}
		
		public function getReg(index:int):Reg
		{
			return regs[index];
		}
		
		public function draw():void
		{
			var tile:Sprite, reg:Sprite, localStage:Array;
			screen = new Sprite();
			screen.graphics.lineStyle(getBufferWidth(), getBufferColor());
			for (var x:int = 0; x < getMapWidth(); x++)
			{
				for (var y:int = 0; y < getMapHeight(); y++)
				{
					tile = getAt([x, y]).genImage()
					localStage = getTileLocalStage([x, y]);
					tile.x = localStage[0];
					tile.y = localStage[1];
					screen.graphics.drawRect(tile.x, tile.y, tile.width, tile.height);
					
					screen.addChild(tile);
					if (!(getAt([x, y]).getReg() == null))
					{
						reg = getAt([x, y]).getReg().genImage();
						reg.x = tile.x;
						reg.y = tile.y;
						screen.addChild(reg);
					}
				}
			}
			getMain().addChild(screen);
		}
		
		private function getTileLocalStage(local:Array):Array
		{
			return [local[0] * (getTileWidth() + getBufferWidth()) + getMain().getMapSpace(Main.LEFT), local[1] * (getTileHeight() + getBufferWidth()) + getMain().getMapSpace(Main.TOP)];
		}
		
		public function getTileAtClick(localStage:Array):Array
		{
			return [(localStage[0] - getMain().getMapSpace(Main.LEFT)) / (getTileWidth() + getBufferWidth()), (localStage[1] - getMain().getMapSpace(Main.TOP)) / (getTileHeight() + getBufferWidth())];
		}
		
		private function getBufferColor():int
		{
			return bufferColor;
		}
		
		private function getBufferWidth():int
		{
			return bufferWidth;
		}
		
		private function getMapWidth():int
		{
			return mapSize[0];
		}
		
		private function getMapHeight():int
		{
			return mapSize[1];
		}
		
		public function getAt(local:Array):Tile
		{
			if (local[0] < 0 || local[1] < 0 || local[0] >= mapSize.x || local[1] >= mapSize.y)
			{
				return null;
			}
			return map[local[0] * getMapWidth() + local[1]];
		}
		
		public function getTileWidth():int
		{
			return getMain().getMapSpace(Main.WIDTH) / (getMapWidth() + bufferWidth);
		}
		
		public function getTileHeight():int
		{
			return getMain().getMapSpace(Main.HEIGHT) / (getMapHeight() + bufferWidth);
		}
		
		public function getMain():Main
		{
			return main;
		}
		
		private function setMapSize(mapSize:Array):void
		{
			this.mapSize = mapSize;
		}
		
		private function setMap(map:Vector.<Tile>):void
		{
			this.map = map;
		}
		
		private function setMain(main:Main):void
		{
			this.main = main;
		}
		
		private function setBuffer(bufferWidth:int, bufferColor:int):void
		{
			this.bufferWidth = bufferWidth;
			this.bufferColor = bufferColor;
		}
	}
}