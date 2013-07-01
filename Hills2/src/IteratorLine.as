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
		
		override public function getNum(at:int):Number
		{
			super.getNum(at);
			var dr:Number = d / rise, df:Number = d / fall, dfr:Number = df + dr, atdfr:Number = at % dfr;
			
			if (atdfr < dr)
				return rise * atdfr + low;
			else
				return -fall * (atdfr - dr) + high;
		}
	}
}