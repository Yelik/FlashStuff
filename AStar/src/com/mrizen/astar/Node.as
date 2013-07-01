package com.mrizen.astar 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Node 
	{
		private var
			node:Sprite,
			lines:Sprite,
			point:Point,
			size:Number,
			nodeColor:uint,
			lineColor:uint,
			connected:Array,
			g:uint,
			from:Node;
		
		public function Node(point:Point) 
		{
			node = new Sprite();
			lines = new Sprite();
			node.addChild(lines);
			this.point = point;
			size = 4;
			nodeColor = 0xFF000000;
			lineColor = nodeColor;
			connected = [];
			g = 0;
			from = null;
			
			drawNode();
		}
		
		private function drawNode():void
		{
			node.graphics.clear();
			node.graphics.lineStyle(1, nodeColor);
			node.graphics.beginFill(nodeColor);
			node.graphics.drawRect(point.x - (size / 2), point.y - (size / 2), size, size);
			node.graphics.endFill();
		}
		
		private function drawLines():void
		{
			lines.graphics.clear();
			if (FlowControl.getToggle())
			{
				lines.graphics.lineStyle(1, lineColor);
				for each(var n:Node in connected)
				{
					lines.graphics.moveTo(point.x, point.y);
					lines.graphics.lineTo(n.getPoint().x, n.getPoint().y);
				}
			}
		}
		
		public function drawPath(pathColor:uint):void
		{
			if (from == null || from == this || from.from == this)
			{
				return
			}
			lines.graphics.clear();
			lines.graphics.lineStyle(3, pathColor);
			lines.graphics.moveTo(point.x, point.y);
			lines.graphics.lineTo(from.getPoint().x, from.getPoint().y);
			from.drawPath(pathColor);
		}
		
		public static function findXDistance(start:Node, end:Node):uint
		{
			return Math.abs(start.point.x - end.point.x);
		}
		
		public static function findYDistance(start:Node, end:Node):uint
		{
			return Math.abs(start.point.y - end.point.y);
		}
		
		public function setConnected(connected:Array):void
		{
			this.connected = connected;
			drawLines();
		}
		
		public function setNodeColor(nodeColor:uint):void
		{
			this.nodeColor = nodeColor;
			drawNode();
		}
		
		public function setG(value:uint):void
		{
			g = value;
		}
		
		public function setFrom(from:Node):void
		{
			this.from = from;
		}
		
		public function getFrom():Node
		{
			return from;
		}
		
		public function getConnected():Array
		{
			return connected;
		}
		
		public function getG():uint
		{
			return g;
		}
		
		public function getNode():Sprite
		{
			return node;
		}
		
		public function getPoint():Point
		{
			return point;
		}
	}
}