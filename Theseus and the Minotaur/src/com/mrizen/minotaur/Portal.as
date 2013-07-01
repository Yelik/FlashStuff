package com.mrizen.minotaur
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Portal extends Tile
	{
		private var portalNumber:uint;
		private var link:Tile;
		
		public function Portal(yRef:uint, xRef:uint, levelNumber:uint, portalNumber:uint)
		{
			super(yRef, xRef, type, levelNumber);
			this.type = 6;
			this.portalNumber = portalNumber;
		}
		
		override protected function prep(e:Event):void
		{
			if (ready)
			{
				this.link = findLink();
			}
			super.prep(e);
		}
		
		override protected function draw():void
		{
			if (portalNumber % 2 == 0)
			{
				tileImage = new MediaLoader.TilePortal1();
			}
			else
			{
				tileImage = new MediaLoader.TilePortal2();
			}
			super.draw();
		}
		
		override public function onEnter(unit:Unit):void
		{
			unit.setCurrentTile(findLink(), false);
		}
		
		public function findLink():Tile
		{
			var linkCords:Array = MapLoader.getLevelInfo(levelNumber)[2][portalNumber];
			return this.findTileAt(linkCords[0], linkCords[1], levelNumber);
		}
	}
}