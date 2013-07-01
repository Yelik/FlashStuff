package com.mrizen.world
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Terrain
	{
		private var tile:Tile;
		private var type:uint;
		
		private var image:Bitmap;
		
		public static const typeAir:uint = 0;
		public static const typeDirt:uint = 1;
		public static const typeWater:uint = 2;
		
		public function Terrain(tile:Tile, type:uint)
		{
			this.tile = tile;
			this.type = type;
			image = findImage();
		}
		
		public function tick():void
		{
		
		}
		
		protected function findImage():Bitmap
		{
			var i:Bitmap;
			if (type == typeAir)
			{
				i = new MediaLoader.air();
			}
			else if (type == typeDirt)
			{
				i = new MediaLoader.dirt();
			}
			else if (type == typeWater)
			{
				i = new MediaLoader.water();
			}
			return i;
		}
		
		public function getImage():Bitmap
		{
			return image;
		}
		
		public function getType():uint
		{
			return type;
		}
	}

}