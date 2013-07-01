package  
{
	/**
	 * ...
	 * @author Yelik
	 */
	public class IteratorLine extends Iterator 
	{
		
		public function IteratorLine(low:Number, high:Number, rise:Number, fall:Number, weight:int) 
		{
			super(low, high, rise, fall, weight);
		}
		
		override public function step():void 
		{
			super.step();
			if (num >= high)
				rising = false;
			else if (num <= low)
				rising = true;
			if (rising)
				num += rise;
			else
				num -= fall;
		}
	}
}