package  
{
	import flash.display.*;
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Game extends Image
	{
		private var loaded:Boolean;
		private var main:Main;
		private var map:Map;
		
		public function Game(main:Main) 
		{
			this.main = main;
			loaded = false;
		}
		
		public function setMap(map:Map):void
		{
			this.map = map;
		}
		
		public function unload():void 
		{
			loaded = false;
			main.removeChild(getImage());
		}
		
		public function load():void
		{
			loaded = true;
			main.addChild(getImage());
		}
		
		override public function drawImage():Sprite 
		{
			var image:Sprite = super.drawImage();
			map.setImage();
			image.addChild(map.getImage());
			return image;
		}
		
		public function getMap():Map 
		{
			return map;
		}
	}
}