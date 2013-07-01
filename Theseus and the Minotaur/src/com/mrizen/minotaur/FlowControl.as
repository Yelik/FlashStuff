package com.mrizen.minotaur
{
	
	/**
	 * ...
	 * @author yelik
	 */
	public class FlowControl
	{
		public static var main:Main;
		public static var mapLoader:MapLoader;
		public static var kongregate:KongregateLoader;
		private static var currentTurn:uint;
		
		public function FlowControl(main:Main)
		{
			FlowControl.main = main;
			
			currentTurn = 0;
			
			mapLoader = new MapLoader();
			main.stage.addChild(mapLoader);
			mapLoader.loadMap(1);
			nextTurn();
			
			kongregate = new KongregateLoader();
		}
		
		public static function levelComplete(levelNumber:uint):void
		{
			mapLoader.unloadMap();
			if (levelNumber < MapLoader.lastMapNumber)
			{
				mapLoader.loadMap(levelNumber + 1);
			}
		}
		
		public static function nextTurn():void
		{
			var u:Array = MapLoader.units;
			
			if (u.length > 0)
			{
				if (currentTurn < u.length)
				{
					u[currentTurn].startMyTurn();
				}
				currentTurn++;
				if (currentTurn >= u.length)
				{
					currentTurn = 0;
				}
			}
			
			for each (var tile:Tile in MapLoader.currentMap)
			{
				tile.setSmellAge(1, true);
			}
		}
		
		public static function kill(u1:Unit):void
		{
			var u:Array = MapLoader.units;
			
			mapLoader.removeChild(u1);
			u.splice(u1.getIndex(), 1);
			u1.getTile().setOccupant(null);
			
			for each (var u2:Unit in u)
			{
				if (u2.getIndex() > u1.getIndex())
				{
					u2.setIndex(-1, true);
				}
			}
		}
	}
}