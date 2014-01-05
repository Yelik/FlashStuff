package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class City extends Sprite
	{
		private var main:Main;
		
		private var pop:Number;
		private var food:Number;
		private var houses:Number;
		private var map:Map;
		
		private var homeless:int;
		private var farmers:int;
		private var builders:int;
		
		public function City(main:Main, startingPop:int, startingHouse:int)
		{
			this.main = main;
			this.food = 0;
			this.houses = startingHouse;
			setPop(startingPop);
			map = new Map(3);
			
			this.main.stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
		}
		
		private function stage_keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				turn();
			}
			else if (e.keyCode == Keyboard.F)
			{
				if (e.shiftKey)
				{
					addFarmer(-1);
				}
				else
				{
					addFarmer(1);
				}
			}
			else if (e.keyCode == Keyboard.B)
			{
				if (e.shiftKey)
				{
					addBuilder(-1);
				}
				else
				{
					addBuilder(1);
				}
			}
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
		
		private function addFarmer(add:int):void
		{
			farmers = addToJob(farmers, add);
		}
		
		private function addBuilder(add:int):void
		{
			builders = addToJob(builders, add);
		}
		
		private function getHouseProd():Number
		{
			return builders / Math.floor(houses);
		}
		
		private function getFoodProd():Number
		{
			return farmers;
		}
		
		private function setPop(value:int):void
		{
			this.pop = value;
			homeless++;
		}
		
		public function turn():void
		{
			map.turn();
			food += getFoodProd();
			houses += getHouseProd();
			if (food / pop / 2 >= 1 && Math.floor(houses) > pop)
			{
				food -= pop * 2;
				setPop(pop + 1);
			}
		}
	}
}