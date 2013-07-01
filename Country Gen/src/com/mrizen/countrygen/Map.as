package com.mrizen.countrygen
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Map extends Sprite
	{
		public var mapCode:Array, image:Sprite, row:int, column:int, colors:Array, size:int;
		
		public function Map(width:int, height:int, colors:Array, size:int)
		{
			mapCode = new Array(width * height);
			this.colors = colors;
			this.size = size;
			for (var i:int = 0; i < mapCode.length; i++)
			{
				mapCode[i] = 0;
			}
			
			row = width;
			column = mapCode.length / row;
			
			image = new Sprite();
			trace("A new map has been created with the dimensions " + row + " by " + column);
		}
		
		public function setTile(x:int, y:int, tile:int):void
		{
			mapCode[(y * row) + x] = tile;
		}
		
		public function getTile(x:int, y:int):int
		{
			return mapCode[(y * row) + x];
		}
		
		public function hasEmpty():Boolean
		{
			for each (var i:int in mapCode)
			{
				if (i == 0)
				{
					return true;
				}
			}
			
			return true;
		}
		
		public function render():void
		{
			var s:Shape, t:Array = new Array(3);
			for (var i:int = 0; i < mapCode.length; i++)
			{
				t[1] = AdvMath.indexToXY(i, row)[0];
				t[2] = AdvMath.indexToXY(i, row)[1];
				t[0] = getTile(t[1], t[2]);
				s = new Shape();
				s.graphics.lineStyle(1, colors[t[0]]);
				s.graphics.beginFill(colors[t[0]]);
				s.graphics.drawRect(t[1] * size, t[2] * size, size, size);
				image.addChild(s);
				trace(getTile(t[1], t[2]));
			}
			show();
		}
		
		public function show():void
		{
			addChild(image);
			Main.i.addChild(this);
		}
		
		public function hide():void
		{
			removeChild(image);
			Main.i.removeChild(this);
		}
	}
}


