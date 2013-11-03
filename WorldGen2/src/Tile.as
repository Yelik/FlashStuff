package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile
	{
		private var land:Boolean;
		private var map:Map;
		private var loc:Array;
		private var nationNum:int;
		
		public function Tile(map:Map, x:int, y:int, land:Boolean = true, nationNum:int = -1)
		{
			setMap(map);
			setLoc([x, y]);
			setLand(land);
			setNationNum(nationNum);
		}
		
		private function setNationNum(nationNum:int):void
		{
			if (nationNum != -1)
			{
				this.nationNum = nationNum;
			}
			else
			{
				trace("no nation");
			}
		}
		
		private function setLoc(array:Array):void
		{
			this.loc = array;
		}
		
		private function setMap(map:Map):void
		{
			this.map = map;
		}
		
		public function getImage():Sprite
		{
			var image:Sprite = new Sprite();
			if (land)
				image.graphics.beginFill(getNation().getColor());
			else
				image.graphics.beginFill(getMap().getMain().getWaterColor());
			image.graphics.drawRect(0, 0, getMap().getTileWidth(false), getMap().getTileHeight(false));
			return image;
		}
		
		public function setLand(boolean:Boolean):void
		{
			this.land = boolean;
		}
		
		public function getX():int
		{
			return getLoc()[0];
		}
		
		public function getY():int
		{
			return getLoc()[1];
		}
		
		public function getLand():Boolean
		{
			return land;
		}
		
		private function getLoc():Array
		{
			return loc;
		}
		
		public function getNation():Nation
		{
			return getMap().getMain().getNations()[nationNum];
		}
		
		public function setNation(number:Number):void 
		{
			this.nationNum = number;
			getNation().addTile(this);
		}
		
		private function getMap():Map
		{
			return map;
		}
	}
}