package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var nations:Vector.<Nation>;
		private var activeMap:Map;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function getNations():Vector.<Nation>
		{
			return nations;
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			nations = new Vector.<Nation>
			
			for (var i:int = 0; i < 2; i++)
			{
				nations.push(new Nation(this, nations.length, 0xFFFFFF * Math.random()));
			}
			
			activeMap = new Map(this);
			
			var width:int = 25;
			var height:int = 25;
			
			activeMap.genMap(width, height);
			
			addChild(activeMap.getImage());
		}
		
		public function getStageWidth():int
		{
			return stage.stageWidth;
		}
		
		public function getStageHeight():int
		{
			return stage.stageHeight;
		}
		
		public function getMapBufferLeft():int
		{
			return 20;
		}
		
		public function getMapBufferRight():int
		{
			return 100;
		}
		
		public function getTileBuffer():int
		{
			return 1;
		}
		
		public function getMapBufferTop():int
		{
			return 20;
		}
		
		public function getMapBufferBot():int
		{
			return 100;
		}
		
		public function getWaterColor():int
		{
			return 0x0000FF;
		}
	}
}