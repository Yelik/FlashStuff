package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private static var uniNumbers:Array = [];
		
		public static var i:Main, preloader:Preloader, imageHolder:ImageHolder;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public static function getUniqueNumber(group:int):int
		{
			if (uniNumbers[group] == null)
			{
				uniNumbers[group] = 0;
			}
			uniNumbers[group]++;
			return uniNumbers[group] - 1;
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			i = this;
			preloader = new Preloader();
			addChild(preloader);
			imageHolder = new ImageHolder();
			var imageIndexs:Array = [];
			imageIndexs.push(preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/Char.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/ForeverAlone.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/Portal1.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/Portal2.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/TileEnd.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/TileFloor.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/TileStart.png"), preloader.loadImage("http://mrizen.com/Dungeon%20Crawler/TileWall.png"));
			imageHolder.addImage(imageIndexs[0], "char");
			imageHolder.addImage(imageIndexs[1], "foreveralone");
			imageHolder.addImage(imageIndexs[2], "portal1");
			imageHolder.addImage(imageIndexs[3], "portal2");
			imageHolder.addImage(imageIndexs[4], "tileend");
			imageHolder.addImage(imageIndexs[5], "tilefloor");
			imageHolder.addImage(imageIndexs[6], "tilestart");
			imageHolder.addImage(imageIndexs[7], "tilewall");
		}
		
		public function donePreloading():void
		{
			Tile.prepareStatic();
			Map.makeMaps();
			Map.loadMap(0);
			Map.unloadMap();
			Map.loadMap(1);
		}
	}
}