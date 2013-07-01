package
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class WorldMainMenu extends World
	{
		private var buttonPlay:Text;
		
		public function WorldMainMenu()
		{
			buttonPlay = new Text("Play", FP.halfWidth, 100);
			addGraphic(buttonPlay);
		}
		
		override public function update():void
		{
			super.update();
			var x:int, y:int;
			if (Input.mousePressed)
			{
				x = Input.mouseX;
				y = Input.mouseY;
				if (x >= buttonPlay.x && x <= buttonPlay.width + buttonPlay.x && y >= buttonPlay.y && y <= buttonPlay.height + buttonPlay.y)
				{
					play();
				}
			}
		}
		
		private function play():void
		{
			FP.world = new WorldPlayerSelect();
		}
	}
}