package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Bullet extends Sprite
	{
		private var xSpeed:Number;
		private var ySpeed:Number;
		private var main:Main;
		
		public function Bullet(main:Main, x:int, y:int, xSpeed:Number, ySpeed:Number, width:int, height:int)
		{
			this.main = main;
			this.ySpeed = ySpeed;
			this.xSpeed = xSpeed;
			this.y = y;
			this.x = x;
			graphics.beginFill(0xFF);
			graphics.drawRect(0, 0, width, height);
			main.addChild(this);
			main.bullets.push(this);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			
			x += xSpeed;
			y += ySpeed;
			if (y > main.stage.stageHeight)
			{
				die();
			}
			if (x > main.stage.stageWidth)
			{
				die();
			}
			else if (x < 0)
			{
				die();
			}
		}
		
		private function die():void
		{
			try
			{
				main.removeChild(this);
			}
			catch (err:Error)
			{
				
			}
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			main.bullets.splice(main.bullets.indexOf(this), 1);
		}
	}
}