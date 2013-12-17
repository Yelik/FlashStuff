package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile extends Sprite
	{
		private var main:Main;
		private var xMap:int;
		private var yMap:int;
		private var typeIndex:int;
		private var isType:Boolean;
		public static var types:Vector.<Tile> = new Vector.<Tile>;
		
		public function Tile(main:Main, x:int, y:int, typeIndex:int, isType:Boolean = false)
		{
			this.isType = isType;
			this.typeIndex = typeIndex;
			this.y = y;
			this.x = x;
			this.main = main;
		}
		
		public static function addType(main:Main, name:String):int
		{
			var t:Tile = new Tile(main, 0, 0, types.length, true)
			t.setName(name);
			types.push(t);
			return types.length;
		}
		
		private function setName(name:String):void
		{
			if (!isType)
				throw new Error("not a type tile");
			this.tileName = name;
		}
	}
}