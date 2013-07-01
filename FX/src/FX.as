package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class FX extends Sprite
	{
		protected var script:Array;
		
		protected static const SKIP:uint = 0, FLAME:uint = 1, SMOKE:uint = 2;
		
		public function FX(script:Array, run:Boolean = true)
		{
			this.script = script;
			if (run)
				start();
		}
		
		public function start():void
		{
			
		}
		
		public function stop():void
		{
		
		}
		
		public function run(e:Event = null):void
		{
		
		}
	}
}