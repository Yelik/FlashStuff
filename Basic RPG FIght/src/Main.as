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
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var sword:Weapon = new Weapon(5, 0.5, 0.5);
			var mace:Weapon = new Weapon(5, 1, 0);
			var dagger:Weapon = new Weapon(5, 0, 1);
			var player:Unit = new Unit(5, 5, 5);
			trace(sword.getDmg(player));
			trace(mace.getDmg(player));
			trace(dagger.getDmg(player));
		}
		
		private function loadBattle(player:Unit, player2:uint):void
		{
			
		}
	}
}