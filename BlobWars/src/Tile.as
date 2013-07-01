package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Tile extends Sprite
	{
		private var gridX:int, gridY:int, color:int, game:Game, entity:Entity;
		private var worth:int;
		
		public static const DEFAULT_COLOR:int = 0;
		
		public function Tile(game:Game, x:int, y:int)
		{
			this.game = game;
			this.gridX = x;
			this.gridY = y;
			color = DEFAULT_COLOR;
			redraw();
			game.addChild(this);
		}
		
		public function getNeighbors():Vector.<Tile>
		{
			var tiles:Vector.<Tile> = new Vector.<Tile>;
			tiles.push(game.getTile(gridX, gridY + 1), game.getTile(gridX, gridY - 1), game.getTile(gridX + 1, gridY), game.getTile(gridX - 1, gridY));
			return tiles;
		}
		
		public function setColor(color:int):void
		{
			this.color = color;
			redraw();
		}
		
		private function redraw():void
		{
			this.x = gridX * game.getHScale();
			this.y = gridY * game.getVScale();
			graphics.clear();
			graphics.lineStyle(1);
			graphics.beginFill(color, 0.5);
			graphics.drawRect(0, 0, game.getHScale(), game.getVScale());
		}
		
		public function getX():int
		{
			return gridX;
		}
		
		public function getY():int
		{
			return gridY;
		}
		
		public function setEntity(entity:Entity):void
		{
			if (entity == null)
			{
				setColor(DEFAULT_COLOR);
			}
			else
			{
				if (this.entity != null)
				{
					if (this.entity == entity)
					{
  						throw(new Error());
					}
					this.entity.removeTile(this);
				}
				setColor(entity.getColor());
			}
			this.entity = entity;
		}
		
		public function hasEntity():Boolean
		{
			return entity != null;
		}
		
		public function getEntity():Entity
		{
			return entity;
		}
		
		public function setWorth(worth:int):void
		{
			this.worth = worth;
		}
		
		public function getWorth():int
		{
			return worth;
		}
	}
}