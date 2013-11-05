package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile extends Image
	{
		private var ent:Ent;
		private var map:Map;
		private var local:Array;
		private var type:int;
		
		public function Tile(map:Map, local:Array)
		{
			setMap(map);
			setLocal(local);
			setType(0);
		}
		
		private function setLocal(local:Array):void 
		{
			this.local = local;
		}
		
		private function setMap(map:Map):void 
		{
			this.map = map;
		}
		
		public function setEnt(ent:Ent):void
		{
			this.ent = ent;
		}
		
		public function getEnt():Ent
		{
			return ent;
		}
		
		override public function drawImage():Sprite
		{
			var image:Sprite = super.drawImage();
			if (ent != null)
			{
				ent.setImage();
				image.addChild(ent.getImage());
			}
			return image;
		}
		
		public function getTileSize():uint 
		{
			return getMap().getTileSize();
		}
		
		public function setType(type:int):void 
		{
			this.type = type;
		}
		
		private function getMap():Map
		{
			return map;
		}
	}
}