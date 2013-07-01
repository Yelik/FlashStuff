package com.mrizen.astar
{
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class FlowControl
	{
		private static var 
			mainRef:Main, 
			flowCtrl:FlowControl,
			toggle:Boolean;
		
		private var 
			nodes:Array, 
			xNodes:uint, 
			yNodes:uint, 
			screenWidth:uint, 
			screenHeight:uint, 
			nodeChance:Number, 
			minConnects:uint,
			xDisBetweenNodes:uint,
			yDisBetweenNodes:uint,
			range:int,
			rangeLimit:int,
			start:Node,
			end:Node;
			
		
		public function FlowControl(main:Main)
		{
			mainRef = main;
			flowCtrl = this;
			screenWidth = 800;
			screenHeight = 800;
			
			xNodes = 64;
			yNodes = 64;
			nodeChance = 0.5;
			minConnects = 0;
			range = 1;
			rangeLimit = 1;
			
			xDisBetweenNodes = screenWidth / xNodes;
			yDisBetweenNodes = screenHeight / yNodes;
			
			newNodes();
			
			mainRef.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			mainRef.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
		}
		
		private function keyDownListener(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				if (toggle)
				{
					toggle = false;
				}
				else 
				{
					toggle = true;
				}
			}
		}
		
		private function keyUpListener(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				connectNodes();
				if (!toggle)
				{
					pathFind();
				}
			}
			else if (e.keyCode == Keyboard.ENTER)
			{
				deleteNodes();
				newNodes();
				toggle = false;
			}
		}
		
		public function newNodes():void
		{
			makeNodes();
			connectNodes();
			
			start = nodes[Math.floor(Math.random() * nodes.length)];
			end = nodes[Math.floor(Math.random() * nodes.length)];
			while(start == end)
			{
				start = nodes[Math.floor(Math.random() * nodes.length)];
				end = nodes[Math.floor(Math.random() * nodes.length)];
			}
			start.setNodeColor(0xFF0000FF);
			end.setNodeColor(0xFFFF0000);
			
			pathFind();
		}
		
		private function makeNodes():void
		{
			nodes = [];
			var n:Node;
			for (var x:uint = 0; x < xNodes - 1; x++)
			{
				for (var y:uint = 0; y < yNodes - 1; y++)
				{
					if (Math.random() <= nodeChance)
					{
						n = new Node(new Point(x * xDisBetweenNodes + (xDisBetweenNodes / 2), y * yDisBetweenNodes + (yDisBetweenNodes / 2)));
						nodes.push(n);
						mainRef.addChild(n.getNode());
					}
				}
			}
		}
		
		private function deleteNodes():void
		{
			for each (var n:Node in nodes)
			{
				getMain().removeChild(n.getNode());
				nodes = [];
				System.gc();
			}
		}
		
		private function connectNodes():void
		{
			var connected:Array = [];
			for each (var n:Node in nodes)
			{
				for each (var c:Node in nodes)
				{
					if (Math.abs(c.getPoint().x - n.getPoint().x) <= range * xDisBetweenNodes && Math.abs(c.getPoint().y - n.getPoint().y) <= range * yDisBetweenNodes)
					{
						connected.push(c);
					}
				}
				
				if (connected.length <= minConnects)
				{
					if (range < rangeLimit)
					{
						range++;
						trace("Connection Range", range);
					}
					deleteNodes();
					makeNodes();
					connectNodes();
					return;
				}
				
				n.setConnected(connected);
				connected = [];
			}
		}
		
		private function pathFind():void
		{
			var
				open:Array,
				closed:Array,
				current:Node,
				n:Node;
				
			open = [start];
			closed = [];
			current = start;
			
			while (closed.indexOf(end) == -1) 
			{
				for each(n in open)
				{
					if (n.getG() < n.getG())
					{
						current = n;
					}
				}
				
				if (current.getConnected().length == 0)
				{
					deleteNodes();
					makeNodes();
					connectNodes();
					pathFind();
				}
				
				for each(n in current.getConnected())
				{
					if (closed.indexOf(n) == -1 && open.indexOf(n) == -1)
					{							
						if (n.getG() < current.getG() + 1)
						{
							n.setG(current.getG() + 1);
							n.setFrom(current);
						}
						
						if (n.getFrom() == null)
						{
							n.setFrom(current);
						}
						
						open.push(n);
					}
				}
				
				closed.push(current);
				open.splice(open.indexOf(current), 1);
			
				current = open[Math.floor(Math.random() * open.length)];
			}
			
			end.drawPath(0xFF00FF00);
		}
		
		public function getDisBetweenNodes():Array
		{
			return [xDisBetweenNodes, yDisBetweenNodes];
		}
		
		public static function getFlowCtrl():FlowControl
		{
			return flowCtrl;
		}
		
		public static function getMain():Main
		{
			return mainRef
		}
		
		public static function getToggle():Boolean
		{
			return toggle;
		}
	}
}