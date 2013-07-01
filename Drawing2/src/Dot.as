package
{
	import flash.geom.Point;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Dot extends Point
	{
		private var color:ColorTransform;
		
		public function Dot(x:Number, y:Number, color:ColorTransform)
		{
			super(x, y);
			this.color = color;
		}
		
		public function getColor():int
		{
			return color.color;
		}
		
		public function getColorTransform():ColorTransform
		{
			return color;
		}
		
		public function setRed(red:int):void
		{
			color.redOffset = red;
		}
		
		public function setBlue(blue:int):void
		{
			color.blueOffset = blue;
		}
		
		public function setGreen(green:int):void
		{
			color.greenOffset = green;
		}
		
		public function getRed():int
		{
			return color.redOffset;
		}
		
		public function getGreen():int
		{
			return color.greenOffset;
		}
		
		public function getBlue():int
		{
			return color.blueOffset;
		}
	}
}