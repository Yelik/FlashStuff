package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var player:Unit = new Unit(10, 0, 15, new Weapon("Mace", 5, 0.9, 0.25));
			var player2:Unit = new Unit(2, 8, 15, new Weapon("Sword", 5, 0.5, 0.5));
			loadFight(player, player2);
		}
		
		private function loadFight(player:Unit, player2:Unit):void
		{
			var p1:BattleUnit = new BattleUnit(player);
			var p2:BattleUnit = new BattleUnit(player2);
		}
	}
}