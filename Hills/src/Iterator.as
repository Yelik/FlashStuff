package
{
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Iterator
	{
		protected var num:Number, rising:Boolean, steps:int, low:Number, fall:Number, rise:Number, high:Number, nums:Array, weight:int;
		
		public function Iterator(low:Number, high:Number, rise:Number, fall:Number, weight:int)
		{
			this.weight = weight;
			this.low = low;
			this.high = high;
			this.rise = rise;
			this.fall = fall;
			num = low;
			rising = true;
			steps = 0;
			nums = [];
		}
		
		public function step():void
		{
			nums.push(num);
			steps++;
		}
		
		public function getNum(at:int):Number
		{
			return nums[at];
		}
		
		public function getNums():Array
		{
			return nums;
		}
		
		public function getWeight():int
		{
			return weight;
		}
	}
}