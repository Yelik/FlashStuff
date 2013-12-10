package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Block extends Shape
	{
		private var xSpeed:int;
		private var ySpeed:int;
		public var mapY:Number;
		public var mapX:Number;
		protected var main:Main;
		protected var moving:Boolean;
		
		public function Block(main:Main, x:int, y:int, width:int, height:int, xSpeed:int = 0, ySpeed:int = 0)
		{
			this.ySpeed = ySpeed;
			this.xSpeed = xSpeed;
			this.main = main;
			this.mapX = x;
			this.mapY = y;
			moving = false;
			if (xSpeed != 0 || ySpeed != 0)
			{
				moving = !moving;
			}
			graphics.lineStyle(1);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, width, height);
			main.blocks.push(this);
			main.addChild(this);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void
		{
			this.x = mapX - main.player.mapX + main.stage.stageWidth / 2;
			this.y = mapY - main.player.mapY + main.stage.stageHeight / 2;
			mapX += xSpeed;
			mapY += ySpeed;
			for each (var block:Block in main.blocks)
			{
				if (hitTestObject(block) && block != this && moving)
				{
					if (mapY < block.mapY && mapX < block.mapX + block.width && mapX > block.mapX - width) // down
					{
						mapY = block.mapY - height - ySpeed;
						ySpeed *= -1;
					}
					else if (mapX > block.mapX && mapY < block.mapY + block.height && mapY > block.mapY - height) //left
					{
						mapX = block.mapX + block.width + xSpeed;
						xSpeed *= -1;
					}
					else if (mapX < block.mapX + width && mapY < block.mapY + block.height && mapY > block.mapY - height) //right
					{
						mapX = block.mapX - width - xSpeed;
						xSpeed *= -1;
					}
					else if (mapY > block.mapY && mapX < block.mapX + block.width && mapX > block.mapX - width) //up
					{
						mapY = block.mapY + block.height + ySpeed;
						ySpeed *= -1;
					}
					
				}
			}
		}
	}
}