package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class WorldGenerator
	{
		private var hills:Array;
		
		public function WorldGenerator()
		{
			hills = [];
		}
		
		public function generate():void
		{
			var it1:IteratorLine = new IteratorLine(0, 600, 2, 2, 50);
			
			for (var i:int = 0; i < Main.i.stage.stageWidth; i++)
			{
				hills[i] = it1.getNum(i);
			}
			
			for (i = 0; i < 1; i++) 
			{
				smooth();
			}
		}
		
		public function smooth():void
		{
			if (hills.length <= 1)
			{
				return;
			}
			for (var j:int = 0; j < hills.length; j++)
			{
				if (j == 0)
				{
					hills[j] = (hills[j] + hills[j + 1]) / 2;
				}
				else if (j == hills.length - 1)
				{
					hills[j] = (hills[j] + hills[j - 1]) / 2;
				}
				else
				{
					hills[j] = (hills[j] + hills[j - 1] + hills[j + 1]) / 3;
				}
			}
		}
		
		public function getHills():Array
		{
			return hills;
		}
	}
}