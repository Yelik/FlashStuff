package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		public static var self:Main;
		
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
			self = this;
			
			addType(new Type(5, Colors.BROWN, 1, true));
			addType(new Type(1, Colors.BLUE, 1, true));
			
			for (var i:int = 0; i < 150; i++) 
			{
				new Particle(i * Particle.SIZE, i * Particle.SIZE, 0);
			}
			for (i = 0; i < 150; i++) 
			{
				new Particle(i * Particle.SIZE + 4,  0, 1);
			}
		}
		
		private function addType(type:Type):void
		{
			Particle.TYPES.push(type);
		}
	}
}