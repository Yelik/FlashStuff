package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Reg
	{
		public static const CREATE:int = -1;
		public static const PEASENTS:int = 0;
		public static const FOOTMAN:int = 1;
		
		public static const NO_DIR:int = -1;
		public static const RIGHT:int = 0;
		public static const UP:int = 1;
		static public const LEFT:int = 2;
		public static const DOWN:int = 3;
		
		private var main:Main;
		private var game:int;
		private var local:Array;
		private var damage:int;
		private var maxLife:int;
		private var curLife:int;
		private var type:int;
		private var team:Boolean;
		private var moved:Boolean;
		
		public function Reg(main:Main, game:int, local:Array, type:int, team:Boolean)
		{
			setGame(game);
			setMain(main);
			if (type == CREATE)
			{
				setLocal(local, false);
			}
			else
			{
				setLocal(local);
			}
			setType(type);
			setTeam(team);
		}
		
		private function setTeam(team:Boolean):void 
		{
			this.team = team;
		}
		
		public function genImage():Sprite
		{
			if (!main.isReady())
			{
				return null;
			}
			var image:Sprite = new Sprite();
			var tileWidth:int = getGame().getTileWidth();
			var tileHeight:int = getGame().getTileHeight();
			if (type == Reg.PEASENTS)
			{
				image.graphics.beginFill(0x0000FF)
				image.graphics.lineStyle(1);
				image.graphics.drawEllipse(tileWidth / 4, tileHeight / 4, tileWidth / 2, tileHeight / 2);
			}
			else if (type == Reg.FOOTMAN)
			{
				image.graphics.beginFill(0xFF0000)
				image.graphics.lineStyle(1);
				image.graphics.drawEllipse(tileWidth / 4, tileHeight / 4, tileWidth / 2, tileHeight / 2);
			}
			if (getDir() == NO_DIR)
			{
				
			}
			else if (getDir() == RIGHT)
			{
				image.graphics.endFill();
				image.graphics.lineStyle(3);
				image.graphics.moveTo(tileWidth / 4 * 3, tileHeight / 2);
				image.graphics.lineTo(tileWidth, tileHeight / 2);
			}
			else if (getDir() == UP)
			{
				image.graphics.endFill();
				image.graphics.lineStyle(3);
				image.graphics.moveTo(tileWidth / 2, tileHeight / 4);
				image.graphics.lineTo(tileWidth / 2, 0);
			}
			else if (getDir() == LEFT)
			{
				image.graphics.endFill();
				image.graphics.lineStyle(3);
				image.graphics.moveTo(tileWidth / 4, tileHeight / 2);
				image.graphics.lineTo(0, tileHeight / 2);
			}
			else if (getDir() == DOWN)
			{
				image.graphics.endFill();
				image.graphics.lineStyle(3);
				image.graphics.moveTo(tileWidth / 2, tileHeight / 4 * 3);
				image.graphics.lineTo(tileWidth / 2, tileHeight);
			}
			return image;
		}
		
		public function getTile():Tile
		{
			return getGame().getAt(getLocal());
		}
		
		public function getTeam():Boolean
		{
			return team;
		}
		
		private function getLocal():Array
		{
			return this.local;
		}
		
		private function getMain():Main
		{
			return main;
		}
		
		private function getDamage():int
		{
			return damage;
		}
		
		public function getGame():Game
		{
			return getMain().getGame(game);
		}
		
		public function getDir():int
		{
			return local[2];
		}
		
		private function tellTile(local:Array):void
		{
			getGame().getAt(local).setReg(this);
		}
		
		private function setDir(dir:int):void
		{
			local[2] = dir;
		}
		
		private function setType(type:int):void
		{
			if (type == CREATE)
			{
				return;
			}
			this.type = type;
			setDamage(getMain().getRegType(type).getDamage());
			setMaxLife(getMain().getRegType(type).getMaxLife());
			setCurLife(getMain().getRegType(type).getCurLife());
		
		}
		
		private function setCurLife(curLife:int):void
		{
			this.curLife = curLife;
		}
		
		private function getCurLife():int
		{
			return curLife;
		}
		
		private function getMaxLife():int
		{
			return maxLife
		}
		
		public function setMaxLife(maxLife:int, heal:Boolean = true):void
		{
			this.maxLife = maxLife
			if (heal)
			{
				curLife = maxLife;
			}
		}
		
		private function setGame(index:int):void
		{
			game = index;
		}
		
		private function setMain(main:Main):void
		{
			this.main = main;
		}
		
		public function setLocal(local:Array, tellTile:Boolean = true):void
		{
			this.local = local;
			if (tellTile)
			{
				this.tellTile(local);
			}
		}
		
		public function setDamage(damage:int):void
		{
			this.damage = damage
		}
		
		public function getMoved():Boolean
		{
			return moved;
		}
		
		public function setMoved(bool:Boolean):void
		{
			this.moved = bool;
		}
	}
}