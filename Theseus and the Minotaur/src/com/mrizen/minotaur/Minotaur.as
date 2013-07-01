package com.mrizen.minotaur
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class Minotaur extends Unit
	{
		
		public function Minotaur(currentTile:Tile, index:uint)
		{
			super(currentTile, index);
		}
		
		override protected function basePrep():void
		{
			image = new MediaLoader.ForeverAlone();
			smell = 0;
			strength = 2;
		}
		
		override protected function myTurn(e:Event):void
		{
			var neighbors:Array = currentTile.getNeighbors();
			
			for each (var tile:Tile in neighbors)
			{
				if (tile.getWalkable())
				{
					if (targetTile is Tile)
					{
						if (tile.getSmell() > targetTile.getSmell())
						{
							targetTile = tile;
						}
						else if (tile.getSmell() == targetTile.getSmell())
						{
							if (tile.getSmell() == 0)
							{
								if (tile.getSmellAge() > targetTile.getSmellAge())
								{
									targetTile = tile;
								}
							}
							else
							{
								if (tile.getSmellAge() < targetTile.getSmellAge())
								{
									targetTile = tile;
								}
							}
						}
					}
					else
					{
						targetTile = tile;
					}
				}
			}
			
			if (targetTile is Tile)
			{
				move(true);
				turnOver = true;
			}
			
			super.myTurn(e);
		}
	}
}