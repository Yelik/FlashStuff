package
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class WorldPlayerSelect extends World
	{
		private var players:Array, confirm:Text, names:Array, selected:EntityBasic;
		
		public function WorldPlayerSelect()
		{
			players = [new EntityCat(5, 0, 0, 0), new EntityTurtle(5, 0, 0, 0)];
			names = [];
			selected = null;
			confirm = new Text("Confirm", FP.halfWidth, FP.height - 100);
			addGraphic(confirm);
			var x:int = 0, y:int = 0, text:Text;
			for each (var e:EntityBasic in players)
			{
				e.x = x;
				e.y = y;
				x += Image(e.graphic).width * 1.75;
				if (x + e.width >= FP.width)
				{
					y += Image(e.graphic).height * 1.75;
				}
				text = new Text(e.getName(), e.x + (Image(e.graphic).width / 2), e.y + (Image(e.graphic).height));
				names.push(text);
				addGraphic(text);
				add(e);
			}
		}
		
		override public function update():void
		{
			super.update();
			if (Input.mousePressed)
			{
				var x:int = Input.mouseX, y:int = Input.mouseY;
				if (x >= confirm.x && x <= confirm.width + confirm.x && y >= confirm.y && y <= confirm.height + confirm.y && selected != null)
				{
					Main.player = selected;
					selected.getSong().loop();
					;
					play();
				}
				else
					for (var i:int = 0; i < players.length; i++)
					{
						var p:EntityBasic = players[i];
						if (x >= p.x && x <= Image(p.graphic).width + p.x && y >= p.y && y <= Image(p.graphic).height + p.y + names[i].height)
						{
							selected = p;
							for each (var t:Text in names)
							{
								t.color = 0xFFFFFF;
							}
							Text(names[i]).color = 0xFF0000;
						}
					}
			}
		}
		
		private function play():void
		{
			FP.world = Level.levels[0];
		}
	}
}