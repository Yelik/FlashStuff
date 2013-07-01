package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Game extends Sprite
	{
		private var grid:D2List, gridWidth:int, gridHeight:int, entities:Vector.<Entity>;
		
		public function Game()
		{
			gridWidth = 10;
			gridHeight = 10;
			grid = new D2List(this, gridWidth, gridHeight);
			entities = new Vector.<Entity>;
			for (var i:int = 0; i < 1; i++)
			{
				new Entity(this).addTile(getTile(Math.random() * gridWidth, Math.random() * gridHeight));
			}
		}
		
		public function start():void
		{
			Main.i.addChild(this);
		}
		
		public function stop():void
		{
			Main.i.removeChild(this);
		}
		
		public function getHScale():Number
		{
			return Main.i.stage.stageWidth / gridWidth;
		}
		
		public function getVScale():Number
		{
			return Main.i.stage.stageHeight / gridHeight;
		}
		
		public function addEntity(entity:Entity):void
		{
			entities.push(entity);
		}
		
		public function removeEntity(entity:Entity):void
		{
			entities.splice(entities.indexOf(entity), 1);
		}
		
		public function getTile(x:int, y:int):Tile
		{
			return grid.getTile(x, y);
		}
		
		public function turn():void
		{
			entities[0].turn();
			entities.push(entities.shift());
		}
	}
}