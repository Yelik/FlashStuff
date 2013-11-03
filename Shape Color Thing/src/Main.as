package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		
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
			onFrame();
		}
		
		private function onFrame(e:Event = null):void
		{
			while (this.numChildren > 0)
			{
				removeChildAt(0);
			}
			var max:int = 100, sides:int = 2;
			for (var i:int = 0; i < max; i++)
			{
				var shape:Shape = new Shape();
				shape.graphics.beginFill(Math.random() * 0xFFFFFF, (max - i) / max);
				shape.graphics.moveTo(0, 0);
				for (var i2:int = 0; i2 < sides; i2++)
				{
					shape.graphics.lineTo(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
				}
				shape.graphics.lineTo(stage.stageWidth, 0);
				for (var i2:int = 0; i2 < sides; i2++)
				{
					shape.graphics.lineTo(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
				}
				shape.graphics.lineTo(stage.stageWidth, stage.stageHeight);
				for (var i2:int = 0; i2 < sides; i2++)
				{
					shape.graphics.lineTo(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
				}
				shape.graphics.lineTo(0, stage.stageHeight);
				for (var i2:int = 0; i2 < sides; i2++)
				{
					shape.graphics.lineTo(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight);
				}
				shape.graphics.lineTo(0, 0);
				addChild(shape);
			}
		}
	}
}