package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Engine
	{
		public static var player:EntityBasic;
		
		public function Main():void
		{
			super(800, 600, 60, false);
		}
		
		override public function init():void
		{
			makeMoves();
			makeLevels();
			FP.world = new WorldMainMenu();
		}
		
		public function makeLevels():void
		{
			Level.levels = new Vector.<Level>;
			Level.levels.push(new Level(1, [new EntityTurtle(5, 0, 0, 0, "dixon")]));
		}
		
		public function makeMoves():void
		{
			Move.moves = new Vector.<Move>;
			
			//turtle
			Move.moves.push(new Move("punch", 1, 1, 2));
			Move.moves.push(new Move("roll", 1.25, 2, 5));
			
			//cat
			Move.moves.push(new Move("slash", 1, 1, 3));
			Move.moves.push(new Move("pounce", 2, 2, 20));
		}
	}
}