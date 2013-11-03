package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Node extends Sprite
	{
		
		public static const NODE_SIZE:int = 6, types:Vector.<Node> = new Vector.<Node>; //stats and types
		
		static public const TYPE_NODE:uint = 0, TYPE_LEAF:uint = 1, TYPE_FORK:uint = 2, TYPE_SEED:uint = 3; //type numbers
		
		private var parentNode:Node, type:uint, childNodes:Vector.<Node>; //functional
		
		private var maxChildren:int, energyPerFrame:Number, startingEnergy:int, lineColor:int, fillColor:int; //stats
		
		public function Node(x:int, y:int, parentNode:Node, type:int)
		{
			if (type == -1)
			{
				return;
			}
			
			this.type = type;
			this.x = x;
			this.y = y;
			this.childNodes = new Vector.<Node>;
			setStatsFromType(type);
			if (parentNode != null)
			{
				this.parentNode = parentNode;
				parentNode.addChild(this);
			}
			else
			{
				Main.I.addChild(this);
			}
			draw();
			drawLines();
		}
		
		private static function addNodeType(maxChildren:int, energyPerFrame:Number, startingEnergy:int, lineColor:int, fillColor:int):void
		{
			var node:Node = new Node(0, 0, null, -1);
			node.setStats(maxChildren, energyPerFrame, startingEnergy, lineColor, fillColor);
			types.push(node);
		}
		
		public static function makeTypes():void
		{
			
			addNodeType(0, 0, 0, 0x000000, 0x00FF00); //node
			addNodeType(0, 1, 0, 0x000000, 0x00FF00); //leaf
			addNodeType(3, 0, 0, 0x000000, 0x00FF00); //fork
			addNodeType(0, 1, 10, 0x000000, 0x802A2A); //seed
		}
		
		public function setStats(maxChildren:int, energyPerFrame:Number, startingEnergy:int, lineColor:int, fillColor:int):void
		{
			this.fillColor = fillColor;
			this.lineColor = lineColor;
			this.startingEnergy = startingEnergy;
			this.energyPerFrame = energyPerFrame;
			this.maxChildren = maxChildren;
		}
		
		public function setStatsFromType(type:int):void
		{
			var stats:Array = types[type].getStats();
			maxChildren = stats[0];
			energyPerFrame = stats[1];
			startingEnergy = stats[2];
			lineColor = stats[3];
			fillColor = stats[4];
		}
		
		private function getStats():Array
		{
			return [maxChildren, energyPerFrame, startingEnergy, lineColor, fillColor];
		}
		
		public function addNode(x:int, y:int, type:uint = 0):Boolean
		{
			if (childNodes.length < maxChildren)
			{
				childNodes.push(new Node(x, y, this, type));
				return true;
			}
			return false;
		}
		
		private function draw():void
		{
			graphics.lineStyle(1, lineColor);
			graphics.beginFill(fillColor);
			graphics.drawCircle(-NODE_SIZE / 2, -NODE_SIZE / 2, NODE_SIZE)
			trace(x, y);
		}
		
		private function drawLines():void
		{
			if (parentNode != null)
			{
				graphics.moveTo(0, 0);
				graphics.lineTo(-x, -y);
			}
		}
	}
}