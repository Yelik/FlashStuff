package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Iterator
	{
		protected var low:Number, high:Number, rise:Number, fall:Number, weight:int, d:Number;
		
		public function Iterator(low:Number, high:Number, rise:Number, fall:Number, weight:int)
		{
			this.weight = weight;
			this.low = low;
			this.high = high;
			this.rise = rise;
			this.fall = fall;
			d = high - low;
		}
		
		public function getNum(at:int):Number
		{
			return 0;
		}
		
		public function getWeight():int
		{
			return weight;
		}
	}
}