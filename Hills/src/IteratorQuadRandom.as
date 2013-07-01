package  
{
	/**
	 * ...
	 * @author Yelik
	 */
	public class IteratorQuadRandom extends IteratorQuad 
	{
		
		public function IteratorQuadRandom(lowMin:Number, highMin:Number, riseMin:Number, fallMin:Number, weightMin:int,lowMax:Number, highMax:Number, riseMax:Number, fallMax:Number, weightMax:int) 
		{
			super(AdvMath.getBetween(lowMin, lowMax), AdvMath.getBetween(lowMax, highMax), AdvMath.getBetween(riseMin, riseMax), AdvMath.getBetween(fallMin, fallMax), AdvMath.getBetween(weightMin, weightMax));
		}
	}
}