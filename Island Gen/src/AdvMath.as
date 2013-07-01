package  
{
	/**
	 * ...
	 * @author Yelik
	 */
	public class AdvMath 
	{
		public static function distance(startX:int, startY:int, endX:int, endY:int):Number
		{
			return Math.abs(startX - endX) + Math.abs(startY - endY);
		}
	}
}