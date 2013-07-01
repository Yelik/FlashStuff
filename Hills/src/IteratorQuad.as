package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class IteratorQuad extends Iterator
	{
		
		public static const MIN:int = 5;
		
		public function IteratorQuad(low:Number, high:Number, rise:Number, fall:Number, weight:int)
		{
			super(low, high, rise, fall, weight);
		}
		
		override public function step():void
		{
			super.step();
			if (num <= 0)
				num = MIN;
			if (num >= high)
				rising = false;
			else if (num <= low + MIN)
				rising = true;
			if (rising)
				num *= rise;
			else
				num *= fall;
		}
	}
}