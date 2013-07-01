package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		static public const MAX_HEIGHT:int = 5;
		private var maze:D2List, mazeSprite:Sprite, p:Point, end:Point, guiHeight:int, gui:Sprite, guiText:TextField;
		private var xScale:Number;
		private var yScale:Number;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var width:int = 10, height:int = 10;
			maze = new D2List(width, height);
			p = new Point(1, 1);
			end = new Point(width - 2, height - 2);
			mazeSprite = new Sprite();
			guiHeight = 50;
			gui = new Sprite();
			guiText = new TextField();
			guiText.text = String(maze.getAtP(p));
			addChild(mazeSprite);
			gui.y = stage.stageHeight - guiHeight;
			addChild(gui);
			gui.addChild(guiText);
			for (var x:int = 0; x < width; x++)
			{
				for (var y:int = 0; y < width; y++)
				{
					if ((x == 0 || x == width - 1 || y == 0 || y == height - 1))
					{
						maze.setAt(x, y, -1);
					}
					else
					{
						maze.setAt(x, y, Math.random() * MAX_HEIGHT + 1);
					}
				}
			}
			redraw();
			maze.traceAll();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keyDown);
			stage.addEventListener(Event.ENTER_FRAME, stage_enterFrame);
		}
		
		private function stage_enterFrame(e:Event):void
		{
			guiText.text = String(maze.getAt(Math.floor(stage.mouseX / xScale), Math.floor(stage.mouseY / yScale)));
		}
		
		private function stage_keyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.SPACE: 
					shiftMaze();
					redraw()
					break;
				
				case Keyboard.UP: 
					move(p.x, p.y - 1);
					break;
				
				case Keyboard.DOWN: 
					move(p.x, p.y + 1);
					break;
				
				case Keyboard.LEFT: 
					move(p.x - 1, p.y);
					break;
				
				case Keyboard.RIGHT: 
					move(p.x + 1, p.y);
					break;
			}
		}
		
		private function move(x:int, y:int):void
		{
			trace(x, y);
			var pHeight:int = maze.getAt(p.x, p.y), targetHeight:int = maze.getAt(x, y);
			trace(pHeight, targetHeight);
			if (Math.abs(targetHeight - pHeight) <= 1 && targetHeight != -1)
			{
				p.x = x;
				p.y = y;
			}
			redraw();
			if (p.x == end.x && p.y == end.y)
			{
				win();
			}
		}
		
		private function win():void
		{
			var t:TextField = new TextField(), f:TextFormat = new TextFormat(null, 100);
			t.defaultTextFormat = f;
			t.text = "You Win!";
			t.autoSize = "left";
			t.x = stage.stageWidth / 2 - 200;
			t.y = stage.stageHeight / 2 - 100;
			addChild(t);
			addEventListener(Event.ENTER_FRAME, shiftAndDraw);
		}
		
		private function shiftAndDraw(e:Event = null):void
		{
			shiftMaze();
			redraw();
		}
		
		private function redraw():void
		{
			xScale = stage.stageWidth / maze.getWidth(), yScale = (stage.stageHeight - guiHeight) / maze.getHeight();
			mazeSprite.graphics.clear();
			for (var x:int = 0; x < maze.getWidth(); x++)
			{
				for (var y:int = 0; y < maze.getWidth(); y++)
				{
					if (maze.getAt(x, y) == -1)
					{
						mazeSprite.graphics.beginFill(0);
						mazeSprite.graphics.drawRect(x * xScale, y * yScale, xScale, yScale);
					}
					else
					{
						mazeSprite.graphics.beginFill(0xFF, 1 / (MAX_HEIGHT + 1) * maze.getAt(x, y));
						mazeSprite.graphics.drawRect(x * xScale, y * yScale, xScale, yScale);
					}
				}
			}
			mazeSprite.graphics.beginFill(0xFF0000, 1);
			mazeSprite.graphics.drawRect(end.x * xScale, end.y * yScale, xScale, yScale);
			mazeSprite.graphics.beginFill(0xFFFF00, 1);
			mazeSprite.graphics.drawRect(p.x * xScale, p.y * yScale, xScale, yScale);
		}
		
		private function shiftMaze():void
		{
			for (var x:int = 1; x < maze.getWidth() - 1; x++)
			{
				for (var y:int = 1; y < maze.getWidth() - 1; y++)
				{
					if (Math.floor(Math.random() * 2) == 0)
					{
						maze.setAt(x, y, maze.getAt(x, y) + 1);
					}
					else
					{
						maze.setAt(x, y, maze.getAt(x, y) - 1);
					}
					if (maze.getAt(x, y) > MAX_HEIGHT)
					{
						maze.setAt(x, y, MAX_HEIGHT);
					}
					else if (maze.getAt(x, y) < 0)
					{
						maze.setAt(x, y, 0);
					}
				}
			}
		}
	}
}