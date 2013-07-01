package com.mrizen.scrollingshooter.utilities
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;
	
	public class FPSCounter extends Sprite
	{
		protected var last:uint = getTimer();
		protected var ticks:uint = 0;
		protected var tf:TextField;
		
		public function FPSCounter(xPos:int = 0, yPos:int = 0, color:uint = 0xffffff, fillBackground:Boolean = false, backgroundColor:uint = 0x000000)
		{
			x = xPos;
			y = yPos;
			tf = new TextField();
			tf.textColor = color;
			tf.text = "----- fps";
			tf.selectable = false;
			tf.background = fillBackground;
			tf.backgroundColor = backgroundColor;
			tf.autoSize = TextFieldAutoSize.LEFT;
			addChild(tf);
			width = tf.textWidth;
			height = tf.textHeight;
			addEventListener(Event.ENTER_FRAME, tick);
		}
		
		public function tick(evt:Event):void
		{
			ticks++;
			var now:uint = getTimer();
			var delta:uint = now - last;
			if (delta >= 1000)
			{
				var fps:Number = ticks / delta * 1000;
				tf.text = fps.toFixed(1) + " fps";
				ticks = 0;
				last = now;
			}
		}
	}
}

