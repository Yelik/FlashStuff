package
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Battle
	{
		private var image:Sprite, choices:Sprite;
		
		public function Battle(Entitys:Array)
		{
			image = new Sprite();
		}
		
		public function start():void
		{
			Main.i.addChild(image);
			displayChoices(["Fight", "Run"]);
		}
		
		public function displayChoices(choicesTxt:Array):void
		{
			var button:SimpleButton;
			choices = new Sprite();
			
			for each (var choiceTxt:String in choicesTxt)
			{
				if (choices.numChildren != 0)
					button.x = choices.getChildAt(choices.numChildren - 1).x;
				button.y = Main.i.stage.stageWidth - button.height;
				choices.addChild(button);
			}
			
			image.addChild(choices);
		}
	}
}