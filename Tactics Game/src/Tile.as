package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile
	{
		static public const CREATE:int = -1;
		static public const FLAT:int = 0;
		static public const VOID:int = 1;
		
		private var local:Array;
		private var type:int;
		private var walkable:Boolean;
		private var main:Main;
		private var game:int;
		private var reg:Reg;
		
		public function Tile(main:Main, game:int, local:Array, type:int)
		{
			setGame(game);
			setMain(main);
			setLocal(local);
			setType(type);
		}
		
		public function genImage():Sprite
		{
			if (!main.isReady())
			{
				return null;
			}
			var image:Sprite = new Sprite();
			if (type == Tile.FLAT)
			{
				image.graphics.beginFill(0x395D33)
				image.graphics.drawRect(0, 0, getGame().getTileWidth(), getGame().getTileHeight());
			}
			else if (type == Tile.VOID)
			{
				image.graphics.beginFill(0)
				image.graphics.drawRect(0, 0, getGame().getTileWidth(), getGame().getTileHeight());
			}
			return image;
		}
		
		private function getGame():Game
		{
			return getMain().getGame(game);
		}
		
		private function getMain():Main
		{
			return main;
		}
		
		public function isWalkable():Boolean
		{
			return walkable
		}
		
		public function getReg():Reg
		{
			return reg;
		}
		
		public function getLocal():Array
		{
			return local;
		}
		
		public function setReg(reg:Reg):void
		{
			this.reg = reg;
		}
		
		public function setWalkable(walkable:Boolean):void
		{
			this.walkable = walkable;
		}
		
		private function setLocal(local:Array):void
		{
			this.local = local;
		}
		
		private function setType(type:int):void
		{
			if (type == CREATE)
			{
				return;
			}
			this.type = type;
			setWalkable(getMain().getTileType(type).isWalkable());
		}
		
		private function setMain(main:Main):void
		{
			this.main = main;
		}
		
		private function setGame(game:int):void
		{
			this.game = game;
		}
	}
}