package
{
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class City extends Tile
	{
		private var pop:int;
		private var homeless:int;
		private var builders:int;
		private var roadBuilders:int;
		
		private var roadLevel:int;
		private var road:Number;
		private var buildings:Number;
		private var food:Number;
		
		public function City(map:Map, x:int, y:Number, pop:int, food:int, buildings:int)
		{
			super(map, x, y, 0, 0, 0);
			this.buildings = buildings;
			this.food = food;
			this.pop = pop;
			this.roadBuilders = 0;
			this.road = 0;
			this.roadLevel = 0;
		}
		
		override public function turn():void
		{
			setFarmers(0);
			setWooders(0);
			setPop(pop);
			buildings += getBuildingGrowth();
			food -= pop;
			if (food <= 0)
			{
				setPop(pop + food);
				food = 0;
			}
			while (food / pop >= 1 && Math.floor(buildings) > pop)
			{
				food -= pop;
				setPop(pop + 1);
			}
			setBuilders(homeless); //temp
		}
		
		private function addToJob(job:int, add:int):int
		{
			function addInt(num:int):void
			{
				homeless -= add;
				job += add;
			}
			if (add < 0)
			{
				if (job + add >= 0)
				{
					addInt(-1);
				}
			}
			else
			{
				if (homeless >= add)
				{
					addInt(1);
				}
			}
			return job;
		}
		
		private function setBuilders(add:int):void
		{
			builders = addToJob(builders, add);
		}
		
		private function setRoadBuilders(add:int):void
		{
			roadBuilders = addToJob(roadBuilders, add);
		}
		
		private function getBuildingGrowth():Number
		{
			return builders / buildings;
		}
		
		public function addFood(food:int):void
		{
			this.food += food;
		}
		
		public function getPop():int
		{
			return pop;
		}
		
		public function getHomeless():int
		{
			return homeless;
		}
		
		public function getBuilders():int
		{
			return builders;
		}
		
		public function getRoadBuilders():int
		{
			return roadBuilders;
		}
		
		public function getFood():int
		{
			return food;
		}
		
		private function setPop(pop:int):void
		{
			this.pop = pop;
			homeless = pop - builders - roadBuilders;
		}
	
	}

}