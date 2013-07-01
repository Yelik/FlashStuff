package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Entity extends Sprite
	{
		private var head:Node, body:Array;
		
		public function Entity(length:int)
		{
			head = new Node(length);
			body = new Array();
			body[0] = new Node(length - 1, head);
			for (var i:int = 1; i < 1; i++)
			{
				body.push(new Node(length - i, body[i - 1]));
				addChild(body[i]);
			}
			addChild(head);
			head.move([200, 200]);
			
			addEventListener(Event.ENTER_FRAME, tick);
		}
		
		public function tick(e:Event = null):void
		{
			head.tick();
			for each (var node:Node in body)
				node.tick();
		}
	}
}