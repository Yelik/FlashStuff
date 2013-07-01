package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private var head:Head, body:Vector.<Node>;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var length:int = 100;
			
			head = new Head();
			body = new Vector.<Node>();
			
			body.push(new Node(head));
			for (var i:int = 1; i < length; i++)
			{
				body.push(new Node(body[i - 1]))
			}
			
			addChild(head);
			for (i = 0; i < body.length; i++)
			{
				addChild(body[i]);
			}
		}
	
	}

}