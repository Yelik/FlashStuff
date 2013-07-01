package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Level
	{
		private var cell:Entity;
		
		public function Level()
		{
			cell = new Entity(1000);
		}
		
		public function start():void
		{
			addToStage(cell);
		}
		
		public static function addToStage(entity:Entity):void
		{
			Main.i.addChild(entity);
		}
	}
}