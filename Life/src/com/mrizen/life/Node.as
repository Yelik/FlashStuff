package com.mrizen.life 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author yelik
	 */
	public class Node extends Sprite
	{
		protected var mapRef:Array;
		protected var xRef:uint;
		protected var yRef:uint;
		protected var mapReady:Boolean;
		
		protected var image:Sprite;
		protected var imageConnecter:Sprite;
		protected var imageNode:Sprite;
		
		protected var color:uint;
		protected var size:Number;
		protected var buffer:Number;
		protected var nodePoint:Point;
		protected var reDraw:Boolean;
		
		protected var drawnNode:Boolean;
		protected var links:Boolean;
		protected var linkTo:Boolean;
		protected var range:uint;
		protected var hasLife:Boolean;
		protected var dies:Boolean;
		protected var lives:Boolean;
		
		protected var linkedTo:Array;
		protected var life:uint;
		protected var lifeP:uint;
		protected var linkedToLife:uint;
		
		protected var drawLoop:Boolean;
		
		public static const nodeID:uint = 0;
		public static const nodeNormID:uint = 1;
		public static const nodeLifeID:uint = 2;
		
		public function Node(xRef:uint,yRef:uint,mapRef:Array) 
		{
			this.mapRef = mapRef;
			this.xRef = xRef;
			this.yRef = yRef;
			
			prepNode();	
			setBehavior();
		}
		
		protected function prepNode():void
		{
			image = new Sprite();
			imageConnecter = new Sprite();
			imageNode = new Sprite();
			image.addChild(imageConnecter);
			image.addChild(imageNode);
			addChild(image);

			size = 8;
			buffer = 0.3;
			color = 0xFF000000;
			reDraw = false;
			drawLoop = false;

			imageNode.x = (xRef + 1) * (size + buffer);
			imageNode.y = (yRef + 1) * (size + buffer);
			
			nodePoint = new Point(imageNode.x, imageNode.y);
			
			addEventListener(Event.ENTER_FRAME, prepNodeDelayed);
		}
		
		protected function setBehavior():void
		{
		}
		
		protected function prepNodeDelayed(e:Event):void
		{			
			if (mapReady = true) {
				if (links) {
					linkedTo = findInRange(xRef, yRef, range);
					if (hasLife) {
						linkedToLife = 0;
						for each(var link:Node in linkedTo) {
							linkedToLife += link.getLife();
						}
					}
				}
				draw();
				removeEventListener(Event.ENTER_FRAME, prepNodeDelayed);
				addEventListener(Event.ENTER_FRAME, loop);
			}
		}
		
		protected function draw():void
		{
			color = findColor();
			if(drawnNode == true){
				imageNode.graphics.clear();
				imageNode.graphics.moveTo(getNodePoint().x, getNodePoint().y);
				imageNode.graphics.beginFill(color);
				imageNode.graphics.drawRect(0, 0, size, size);
				imageNode.graphics.endFill();
			}
		}
		
		protected function loop(e:Event):void
		{	
			if (drawLoop == false) {
				drawLoop = true;
				if (links) {
					if (hasLife) {
						linkedToLife = 0;
						for each(var link:Node in linkedTo) {
							linkedToLife += link.getLife();
						}
						if (linkedToLife >= 3 && linkedToLife <= 4) {
							if (lives) {
								lifeP ++;
								reDraw = true;
							}
						}else if (dies) {
							lifeP = 0;
							reDraw = true;
						}
						if (lifeP < 0) {
							lifeP = 0;
						}else
						if (lifeP > linkedTo.length) {
							lifeP = linkedTo.length;
						}
					}
				}
			}
			if (drawLoop == true) {
				drawLoop = false;
				life = lifeP
				if (reDraw == true) {
					draw();
				}
				loop2();
			}
		}
		
		protected function loop2():void
		{
			
		}
			
		protected function splitColor(color:Number):Array
		{	
			return new Array((color>>24)&0xFF,(color>>16)&0xFF,(color>>8)&0xFF,(color)&0xFF);
		}
		
		protected function makeColor(alpha:Number,red:Number,green:Number,blue:Number):Number
		{
			var color:Number = alpha<<24 | red<<16 | green<<8 | blue;
			
			return color;
		}
		
		protected function findColor():uint
		{
			var a:Array = splitColor(color);
			
			if (isAlive()) {
				a[2] = (life / linkedTo.length) * 0xFF;
			}
			
			return makeColor(a[0], a[1], a[2], a[3]);
		}
		
		protected function findInRange(xRef:uint, yRef:uint, range:uint):Array
		{
			var inRange:Array = new Array;
			var target:Node;
			
			for (var x:int = -range; x <= range; x++) {
				for (var y:int = -range; y <= range; y++) {
					target = findNodeAt(xRef + x, yRef + y);
					if(target != null && target != this){
						inRange.push(target);
					}
				}
			}
			
			return inRange;
		}
		
		protected function findNodeAt(xRef:uint, yRef:uint):Node
		{
			var target:Node;

			if(xRef >= 0 && xRef <= mapRef.length-1 && mapRef[xRef] is Array){
				if (yRef >= 0 && yRef <= mapRef[xRef].length && mapRef[xRef][yRef] is Node) {
					if (mapRef[xRef][yRef].getLinks()) {
						target = mapRef[xRef][yRef];
					}
				}
			}
			
			return target;
		}
		
		public function setMapReady(status:Boolean = true):void
		{
			mapReady = status;
		}

		public function setRedraw(value:Boolean = true):void
		{
			reDraw = value;
		}
		
		public function isAlive():Boolean
		{
			if (life >= 1) {
				return true;
			}else {
				return false;
			}
		}
		
		public function getLife():uint
		{
			return life;
		}
		
		public function getLinks():Boolean
		{
			return links;
		}
		
		public function getNodePoint():Point
		{
			return nodePoint;
		}

		public function getColor():uint
		{
			return color;
		}
	}
}