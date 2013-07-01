package com.mrizen.simpleshooter
{
	import com.mrizen.advmath.AdvMath;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Ship extends Sprite
	{
		private var xSpeed:Number, ySpeed:Number, accel:Number, turnSpeed:int, maxSpeed:int, image:Bitmap;
		
		private static const friction:Number = .95;
		
		public function Ship()
		{
			xSpeed = 0;
			ySpeed = 0;
			accel = 1;
			turnSpeed = 10;
			maxSpeed = 10;
			image = new MediaLoader.ship();
			image.x = -(image.width / 2);
			image.y = -(image.height / 2);
			addChild(image);
			
			addEventListener(Event.ENTER_FRAME, frame);
			FlowControl.mainRef.stage.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function frame(e:Event):void
		{
			var current:Point = new Point(x, y);
			var mouse:Point = new Point(FlowControl.mainRef.mouseX, FlowControl.mainRef.mouseY);
			var speeds:Array = AdvMath.moveAtTarget(current, mouse, accel);
			
			if (Math.abs(speeds[0] + speeds[1]) < maxSpeed)
			{
				xSpeed += speeds[0];
				ySpeed += speeds[1];
			}
			
			xSpeed *= friction;
			ySpeed *= friction;
			
			/*if (KeyListener.downKey)
			   {
			   turn(90);
			   }
			   else if (KeyListener.leftKey)
			   {
			   turn(180);
			   }
			   else if (KeyListener.upKey)
			   {
			   turn(-90);
			   }
			   else if (KeyListener.rightKey)
			   {
			   turn(0);
			 }*/
			if (KeyListener.eKey)
			{
				turn(15, true);
			}
			else if (KeyListener.qKey)
			{
				turn(-15, true);
			}
			
			x += xSpeed;
			y += ySpeed;
		}
		
		private function turn(towards:int, relitive:Boolean = false):void
		{
			if (!relitive)
			{
				if (rotation < towards)
				{
					rotation += turnSpeed;
				}
				else if (rotation > towards)
				{
					rotation -= turnSpeed;
				}
			}
			else
			{
				rotation += towards;
			}
		}
		
		private function click(e:MouseEvent):void
		{
			
		}
	}
}