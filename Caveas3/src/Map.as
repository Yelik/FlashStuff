package
{
	import flash.display.*;
	
	/* This is a Cave Generation algorithm created by
	 * Chevy Johnston. If you have any questions,
	 * I can be contacted via happytrash@gmail.com.
	 *
	 * When you create a new Map, the constructor has
	 * four parameters. These are as follows:
	 *
	 * 		minSize
	 * 				The minimum amount of cells allowed.
	 * 		maxSize
	 * 				The maximum amount of cells allowed (0 = no limit).
	 * 		turnRatio
	 * 				Percent representing how often the paths will change direction
	 * 				the lower this is, the more linear your cave will be, and the
	 * 				higher it is, it will have more turns and be more spread out.
	 * 		iter
	 * 				This is used for the recursive checks, just leave it default.
	 *
	 * These will only give you limited control over
	 * the shape of your cave, though. This algorithm
	 * is really flexible, and can create all different
	 * shapes of caves. The trick is all in the function:
	 *
	 * 		adjacentCells().
	 *
	 * Every time we work with a cell, the algorithm decides
	 * how many adjacent cells. This function returns that
	 * value. It has two parameters, which are passed to it
	 * during the generateCave() loop. They are as follows:
	 *
	 * 		openPaths:
	 * 				this is how many Paths are still Open. Every time a new Cell
	 * 				is placed, openPaths is increased by 1. When a Cell is dealt
	 * 				with, it is closed, and openPaths is reduced by 1.
	 * 		type:
	 * 				this is the type, as passed down by the type declared for
	 * 				generateCave(). I've created two example types, "WIDE" and
	 * 				"THIN" to show how this parameter can be used.
	 *
	 * If you look in this function, you can see that I've
	 * laid out a basic setup in which the return value
	 * changes based on how many openPaths there are, and
	 * which type you are set to use. You can see how the
	 * "WIDE" type has a larger chance of returning a
	 * greater value than the default type does, etc.
	 *
	 * So try messing around with that function and seeing
	 * what kinds of results you can get. Remember to try
	 * each of your setups with different turnRatio rates,
	 * because sometimes that can really change how things
	 * look! Good luck.
	 *
	 * */
	
	public class Map extends Sprite
	{
		// CELL COLORS
		public const EMPTY:uint = 0xCCCCCC, FILLED:uint = 0x000000, START:uint = 0x0000FF, END:uint = 0xFF0000;
		
		// MAP INFORMATION
		public var map:Bitmap, mapData:BitmapData, mapWidth:int, mapHeight:int, cellCount:int = 0;
		
		// START & END POSITIONS
		public var startX:int, startY:int, endX:int, endY:int;
		
		// CONSTRUCTOR
		public function Map(width:int, height:int)
		{
			mapWidth = width;
			mapHeight = height;
			mapData = new BitmapData(width, height, false, EMPTY);
			map = new Bitmap(mapData);
			addChild(map);
		}
		
		// GENERATE A CAVE
		public function generateCave(minSize:int = 0, maxSize:int = 0, turnRatio:Number = .5, type:String = "", iter:int = 0):void
		{
			// Clear the Current Map
			cellCount = 1;
			mapData.fillRect(mapData.rect, EMPTY);
			
			// Create the Start Cell
			startX = mapWidth / 2;
			startY = mapHeight / 2;
			mapData.setPixel(startX, startY, FILLED);
			
			// Create the X/Y List with the Start Cell
			var xList:Array = [startX], yList:Array = [startY];
			
			// Other various vars
			var openPaths:int = 1, orderList:Array = shuffle([0, 1, 2, 3]), xoffset:Array = [1, 0, -1, 0], yoffset:Array = [0, -1, 0, 1], adjacentNum:int = 2, cellx:int, celly:int;
			
			// For each Cell on the List
			for (var p:int = 0; p < cellCount; p++)
			{
				// Get the Cell we are working with
				cellx = xList.pop();
				celly = yList.pop();
				
				// Decide how many adjacent Cells to create around this Cell
				adjacentNum = adjacentCells(openPaths, type);
				
				// Shuffle the Order List
				if (Math.random() < turnRatio)
					orderList = shuffle(orderList);
				
				// For each Adjacent Position (dealt with in the order as defined by orderList)
				if (adjacentNum > 0)
				{
					for (var a:int = 0; a < 4; a++)
					{
						var adjx:int = cellx + xoffset[orderList[a]], adjy:int = celly + yoffset[orderList[a]];
						
						if (adjx >= 0 && adjx < mapWidth && adjy >= 0 && adjy < mapHeight)
						{
							if (mapData.getPixel(adjx, adjy) == EMPTY)
							{
								// Add and Fill the adjacent Cell
								xList.push(adjx);
								yList.push(adjy);
								mapData.setPixel(adjx, adjy, FILLED);
								openPaths++;
								cellCount++;
								adjacentNum--;
								
								// Break when we can't create any more adjacent Cells
								if (adjacentNum == 0)
									break;
							}
						}
						if (cellCount == maxSize)
							break;
					}
					if (cellCount == maxSize)
						break;
				}
				openPaths--;
			}
			
			// Use recursive check to minimize the map size
			if (cellCount - iter < minSize)
			{
				generateCave(minSize, maxSize, turnRatio, type, iter + 10);
			}
			else
			{
				endX = cellx;
				endY = celly;
				mapData.setPixel(startX, startY, START);
				mapData.setPixel(endX, endY, END);
			}
		}
		
		// CHOOSE HOW MANY ADJACENT PATHS
		public function adjacentCells(openPaths:int, type:String = ""):int
		{
			switch (type)
			{
				case "THIN": 
				{
					if (openPaths > 1)
					{
						// This is one of multiple open paths
						switch (int(Math.random() * 7))
						{
							case 0: 
								return 0;
								break;
							case 1: 
								return 2;
								break;
							default: 
								return 1;
								break;
						}
					}
					else
					{
						// This is the last open path
						return 1;
					}
					break;
				}
				
				case "WIDE": 
				{
					if (openPaths > 1)
					{
						// This is one of multiple open paths
						switch (int(Math.random() * 4))
						{
							case 0: 
								return 1;
								break;
							case 1: 
								return 2;
								break;
							case 2: 
								return 3;
								break;
							case 3: 
								return 4;
								break;
							default: 
								return 1;
								break;
						}
					}
					else
					{
						// This is the last open path
						switch (int(Math.random() * 3))
						{
							case 0: 
								return 1;
								break;
							default: 
								return 2;
								break;
						}
					}
					break;
				}
				
				default: 
				{
					if (openPaths > 1)
					{
						// This is one of multiple open paths
						switch (int(Math.random() * 4))
						{
							case 0: 
								return 0;
								break;
							case 1: 
								return 1;
								break;
							case 2: 
								return 1;
								break;
							case 3: 
								return 2;
								break;
							default: 
								return 1;
								break;
						}
					}
					else
					{
						// This is the last open path
						switch (int(Math.random() * 4))
						{
							case 0: 
								return 1;
								break;
							case 1: 
								return 1;
								break;
							case 2: 
								return 1;
								break;
							case 3: 
								return 2;
								break;
							default: 
								return 1;
								break;
						}
					}
					break;
				}
			}
			return 0;
		}
		
		// SHUFFLE ARRAY
		public function shuffle(arr:Array):Array
		{
			var arr2:Array = [], i:int = 0;
			while (arr.length > 0 && i < 10)
			{
				arr2.push(arr.splice(Math.floor(Math.random() * arr.length), 1));
				i++;
			}
			return arr2;
		}
	}
}