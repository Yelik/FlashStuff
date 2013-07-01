package com.mrizen.scrollingshooter
{
	import com.mrizen.scrollingshooter.utilities.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Help extends SecondLevel
	{
		protected static var text:String, textBox:TextField, format:TextFormat, main:Sprite, mainImage:Bitmap, back:Bitmap;
		
		public function Help()
		{
			text = "This is a scrolling shooter. You are the dark red thing at the bottom.  Arrow keys to move and space bar to fire. Do not run into an enemy. "
			textBox = new TextField();
			format = new TextFormat("arial", 28, 0xFF000000);
			mainImage = new MediaLoader.helpMain();
			back = new MediaLoader.helpBack();
			main = new Sprite();
			
			textBox.text = text;
			textBox.setTextFormat(format);
			
			textBox.y = back.height;
			textBox.wordWrap = true;
			textBox.selectable = false;
			
			textBox.width = FlowControl.mainRef.stage.stageWidth;
			textBox.height = 100;
			
			main.x = FlowControl.mainRef.stage.stageWidth / 2 - mainImage.width / 2;
			main.y = textBox.y + textBox.height;
			main.addChild(mainImage);
			
			back.x = FlowControl.mainRef.stage.stageWidth / 2 - back.width / 2;
			
			addChild(back);
			addChild(textBox);
			addChild(main);
			
			main.addEventListener(MouseEvent.CLICK, mainClicked);
		}
		
		protected function mainClicked(e:MouseEvent):void
		{
			unload();
			FlowControl.loadMainMenu();
		}
		
		override protected function getName():String
		{
			return "Help";
		}
	}
}
