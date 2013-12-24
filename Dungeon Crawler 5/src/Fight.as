package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Fight extends Sprite
	{
		private var textP1Name:TextField;
		private var textP1NameX:int;
		private var textP1NameY:int;
		
		private var textP2Name:TextField;
		private var textP2NameX:int;
		private var textP2NameY:int;
		
		private var p1:Player;
		private var p2:Player;
		private var main:Main;
		
		private var p1Health:Number;
		private var p1Power:Number;
		private var p1Skill:Number;
		private var p1Speed:Number;
		
		private var p2Health:Number;
		private var p2Power:Number;
		private var p2Skill:Number;
		private var p2Speed:Number;
		
		private var textP1Health:TextField;
		private var textP2Health:TextField;
		
		private var textP1Power:TextField;
		private var textP2Power:TextField;
		
		private var textP1Skill:TextField;
		private var textP2Skill:TextField;
		
		private var textP1Speed:TextField;
		private var textP2Speed:TextField;
		
		private var textMain:TextField;
		private var textMainX:int;
		private var textMainY:int;
		
		public function Fight(main:Main, p1:Player, p2:Player)
		{
			textMainX = 200;
			textMainY = 0;
			
			textP1NameX = 100;
			textP1NameY = 100;
			
			textP2NameX = main.stage.stageWidth - 100 - 50;
			textP2NameY = 100;
			
			this.main = main;
			this.p2 = p2;
			this.p1 = p1;
			
			p1Health = p1.health;
			p2Health = p2.health;
			
			p1Power = p1.power;
			p2Power = p2.power;
			
			p1Skill = p1.skill;
			p2Skill = p2.skill;
			
			p1Speed = p1.speed;
			p2Speed = p2.speed;
			
			draw();
			redraw();
			updateText();
			
			addMainText("BATTLE START!");
			addMainText("Your Turn");
		}
		
		private function addMainText(text:String):void
		{
			textMain.appendText(text + "\n");
			updateText();
		}
		
		private function draw():void
		{
			textP1Name = makeTextField(p1.pName, textP1NameX, textP1NameY);
			textP2Name = makeTextField(p2.pName, textP2NameX, textP2NameY);
			
			textP1Health = makeTextField("Health " + p1Health, textP1NameX, textP1NameY + textP1Name.height);
			textP2Health = makeTextField("Health " + p2Health, textP2NameX, textP2NameY + textP2Name.height);
			
			textP1Power = makeTextField("Power " + p1Power, textP1NameX, textP1NameY + textP1Name.height + textP1Health.height);
			textP2Power = makeTextField("Power " + p2Power, textP2NameX, textP2NameY + textP2Name.height + textP2Health.height);
			
			textP1Speed = makeTextField("Speed " + p1Speed, textP1NameX, textP1NameY + textP1Name.height + textP1Health.height + textP1Power.height);
			textP2Speed = makeTextField("Speed " + p2Speed, textP2NameX, textP2NameY + textP2Name.height + textP2Health.height + textP2Power.height);
			
			textP1Skill = makeTextField("Skill " + p1Skill, textP1NameX, textP1NameY + textP1Name.height + textP1Health.height + textP1Power.height + textP1Speed.height);
			textP2Skill = makeTextField("Skill " + p2Skill, textP2NameX, textP2NameY + textP2Name.height + textP2Health.height + textP2Power.height + textP2Speed.height);
			
			textMain = new TextField();
			textMain.x = textMainX;
			textMain.y = textMainY;
			textMain.height = main.stage.stageHeight;
			textMain.scrollV = 0xFFFFFF;
			textMain.width = main.stage.stageWidth - 200;
			addChild(textMain);
		}
		
		private function erase():void
		{
			removeChild(textP1Name);
			removeChild(textP1Health);
			removeChild(textP1Power);
			removeChild(textP1Skill);
			removeChild(textP1Speed);
			
			removeChild(textP2Name);
			removeChild(textP2Health);
			removeChild(textP2Power);
			removeChild(textP2Skill);
			removeChild(textP2Speed);
			
			textP1Name = null;
			textP1Health = null;
			textP1Power = null;
			textP1Skill = null;
			textP1Speed = null;
			
			textP2Name = null;
			textP2Health = null;
			textP2Power = null;
			textP2Skill = null;
			textP2Speed = null;
		}
		
		private function updateText():void
		{
			textP1Health.text = "Health " + p1Health;
			textP1Power.text = "Power " + p1Power;
		}
		
		private function redraw():void
		{
			erase();
			draw();
		}
		
		private function makeTextField(text:String, x:int, y:int):TextField
		{
			var textField:TextField = new TextField();
			textField.x = x;
			textField.y = y;
			textField.appendText(text);
			textField.autoSize = "left";
			addChild(textField);
			return textField;
		}
	}
}