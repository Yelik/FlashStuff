package  
{
	import flash.geom.*;
	/**
	 * ...
	 * @author Yelik
	 */
	public class Room 
	{
		private var start:Point, end:Point, tiles:Array;
		
		public function Room(start:Point, end:Point) 
		{
			tiles = new Array();
			this.start = start;
			this.end = end;
		}
		
		public function addTile(x:int, y:int):void
		{
			tiles.push(new Point(x, y));
		}
	}
}