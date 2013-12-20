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
			addEventListener(Event.ENTER_FRAME, main_enterFrame);
		}
		
		private function main_enterFrame(e:Event):void
		{
			x += xSpeed;
			y += ySpeed;
			if (y > main.stage.stageHeight)
			{
				y = 0;
			}
		}
	}
}