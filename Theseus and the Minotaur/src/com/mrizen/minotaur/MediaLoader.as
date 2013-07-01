package com.mrizen.minotaur
{
	
	/**
	 * ...
	 * @author yelik
	 */
	public class MediaLoader
	{
		[Embed(source="art/TileFloor.png")]
		public static var TileFloor:Class;
		
		[Embed(source="art/TileFloor2.png")]
		public static var TileFloor2:Class;
		
		[Embed(source="art/TileWall.png")]
		public static var TileWall:Class;
		
		[Embed(source="art/TileStart.png")]
		public static var TileStart:Class;
		
		[Embed(source="art/TileEnd.png")]
		public static var TileEnd:Class;
		
		[Embed(source="art/Portal1.png")]
		public static var TilePortal1:Class;
		
		[Embed(source="art/Portal2.png")]
		public static var TilePortal2:Class;
		
		[Embed(source="art/Char.png")]
		public static var Character:Class;
		
		[Embed(source="art/ForeverAlone.png")]
		public static var ForeverAlone:Class;
		
		public function MediaLoader()
		{
		
		}
	}
}