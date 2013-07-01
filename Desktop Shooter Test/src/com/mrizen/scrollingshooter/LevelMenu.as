package com.mrizen.scrollingshooter
{
	import com.mrizen.scrollingshooter.ingame.*;
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class LevelMenu extends SecondLevel
	{
		protected static var title:Bitmap, levels:Array = [], w:int, h:int, buffer:int, inRow:int;
		
		public function LevelMenu()
		{
			var b:Bitmap = new MediaLoader.levelmenuLevel();
			buffer = 2;
			w = b.width + buffer;
			h = b.height + buffer;
			inRow = FlowControl.mainRef.stage.stageWidth / (b.width + buffer);
			
			title = new MediaLoader.levelmenuTitle();
			title.x = FlowControl.mainRef.stage.stageWidth / 2 - title.width / 2;
			addChild(title);
			
			var s:Sprite, n:TextField, r:int, r2:int;
			for (var i:int = 0; i < Level.levels.length; i++)
			{
				s = new Sprite();
				b = new MediaLoader.levelmenuLevel();
				n = new TextField();
				r = i + 1;
				r2 = 0;
				while (r > inRow)
				{
					r -= inRow;
					r2++;
				}
				s.addChild(n);
				s.addChild(b);
				n.text = String(i + 1);
				n.x = b.width;
				s.x = (i + 1) * w;
				s.y = (r2 * h) + h;
				levels.push(s);
				s.addEventListener(MouseEvent.CLICK, levelClick);
				addChild(s);
			}
		
		}
		
		protected function levelClick(e:MouseEvent):void
		{
			for each (var s:Sprite in levels)
			{
				if (s == e.target)
				{
					unload();
					FlowControl.loadLevel(levels.indexOf(s) + 1);
				}
			}
		}
		
		override protected function getName():String
		{
			return "Level Menu";
		}
	}
}


