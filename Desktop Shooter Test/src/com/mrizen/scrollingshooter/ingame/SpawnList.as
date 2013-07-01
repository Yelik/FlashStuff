package com.mrizen.scrollingshooter.ingame
{
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class SpawnList
	{
		protected var  currentPoint:int, currentCommand:int, currentType:int, currentDelay:int, level:Level;
		
		public var points:Array, commands:Array, types:Array, delays:Array;
		
		public function SpawnList(levelNumber:int)
		{
			points = [];
			commands = [];
			types = [];
			delays = [];
			currentPoint = 0;
			currentCommand = 0;
			currentType = 0;
			currentDelay = 0;
			
			level = Level.getLevel(levelNumber);
			
			IngameControl.i.addEventListener(Event.ENTER_FRAME, frame);
		}
		
		protected function frame(e:Event):void
		{
			if (level.spawning)
			{
				if (level.spawnDelay == 0)
				{
					spawnNext();
				}
				else
				{
					level.spawnDelay--;
				}
			}
		}
		
		public function spawnNext():Enemy
		{
			var e:Enemy = new Enemy(points[currentPoint], types[currentType], commands[currentCommand]);
			level.spawnDelay = delays[currentDelay];
			currentDelay++;
			currentCommand++;
			currentPoint++;
			currentType++;
			if (currentDelay > delays.length - 1)
			{
				currentDelay = 0;
			}
			if (currentCommand > commands.length - 1)
			{
				currentCommand = 0;
			}
			if (currentPoint > points.length - 1)
			{
				currentPoint = 0;
			}
			if (currentType > types.length - 1)
			{
				currentType = 0;
			}
			return e;
		}
	}
}
