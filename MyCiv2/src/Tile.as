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
		protected var map:Map;
		
		public static const FLAT:int = 0;
		public static const HILLS:int = 1;
		public static const MOUNTAIN:int = 2;
		
		public function Tile(map:Map, x:int, y:int, wood:int, height:int, woodGrowth:Number)
		{
			this.map = map;
			this.wood = wood;
			this.y = y;
			this.x = x;
			
			this.woodGrowth = woodGrowth;
			
			
		}
		
		public function turn():void
		{
			City(map.getAt(map.getCenter())).addFood(getFoodProd());
			setWood(wood - getWoodProd());
			wood = Math.min(woodGrowth * wood, maxWood);
		}
		
		public function setFarmers(pop:int):void
		{
			if (City(map.getAt(map.getCenter())).getHomeless() < pop)
			{
				this.farmers = pop;
			}
		}
		
		public function setWooders(pop:int):void
		{
			this.wooders = pop;
		}
		
		public function getWood():int
		{
			return wood;
		}
		
		public function getWoodProd():int
		{
			return Math.min(wood, wooders);
		}
		
		public function getFoodProd():int
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
		
		public function getFarmers():int
		{
			return farmers;
		}
		
		public function getWooders():int
		{
			return wooders;
		}
	}
}