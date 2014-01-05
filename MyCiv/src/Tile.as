package
{
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Tile
	{
		private var x:int;
		private var y:int;
		private var wood:Number;
		private var maxWood:int = 1000;
		
		private var farmers:int;
		private var wooders:int;
		private var woodGrowth:Number;
		
		public static const FLAT:int = 0;
		public static const HILLS:int = 1;
		public static const MOUNTAIN:int = 2;
		
		public function Tile(x:int, y:int, wood:int, height:int)
		{
			this.wood = wood;
			this.y = y;
			this.x = x;
			
			woodGrowth = 1.01;
			
			setFarmers(1);
			setWooders(9);
		}
		
		public function turn():void
		{
			setWood(wood - getWood());
			wood = Math.min(woodGrowth * wood, maxWood);
		}
		
		public function setFarmers(pop:int):void
		{
			this.farmers = pop;
		}
		
		public function setWooders(pop:int):void
		{
			this.wooders = pop;
		}
		
		public function getWood():int
		{
			return Math.min(wood, wooders);
		}
		
		public function getFood():int
		{
			return Math.min(getSpace(), farmers);
		}
		
		public function getSpace():int
		{
			return Math.floor((maxWood - wood) / 10);
		}
		
		public function setWood(num:int):void
		{
			this.wood = num;
		}
	}
}