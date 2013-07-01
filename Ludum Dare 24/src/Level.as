package
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Level extends World
	{
		private var entities:Array, levelNumber:int, turn:Boolean, moves:Graphiclist, player:EntityFighter, playerStats:Graphiclist, playerHealthbar:Graphiclist, enemy:EntityFighter, enemyStats:Graphiclist, enemyHealthbar:Graphiclist, moveStats:Graphiclist, move:Text;
		public static var levels:Vector.<Level>;
		
		public function Level(levelNumber:int, entities:Array)
		{
			this.levelNumber = levelNumber;
			this.entities = entities;
			turn = true;
			moveStats = new Graphiclist();
		}
		
		override public function begin():void
		{
			FP.screen.color = 0x999999
			drawEnemy();
			drawEnemyStats();
			drawEnemyHealthbar();
			drawPlayer();
			drawPlayerStats();
			drawPlayerHealthbar();
			drawMovesTitle();
			drawMoves();
		}
		
		override public function update():void
		{
			super.update();
			player.setEnergy(4);
			turn = false;
			if (turn)
			{
				var x:int = Input.mouseX, y:int = Input.mouseY;
				if (Input.mousePressed)
				{
					
				}
				else
					for each (var t:Text in moves)
					{
						if (x > t.x && x < t.x + t.width && y > t.y && y < t.y + t.height)
						{
							
						}
					}
			}
			else
			{
				drawPlayerHealthbar();
				drawEnemyHealthbar();
				drawPlayerStats();
				drawEnemyStats();
			}
		}
		
		private function getMovesAsText(e:EntityFighter):Graphiclist
		{
			var a:Graphiclist = new Graphiclist();
			for each (var m:Move in e.getMoves())
			{
				a.add(new Text(m.getName()));
			}
			return a;
		}
		
		private function getStatsAsText(e:EntityFighter):Graphiclist
		{
			return new Graphiclist(new Text(e.getName()), new Text("damage " + e.getDamage()), new Text("max health " + e.getMaxHealth()), new Text("speed " + e.getSpeed()), new Text("energy " + e.getEnergy()));
		}
		
		private function drawEnemy():void
		{
			enemy = new EntityFighter(entities[0]);
			enemy.x = FP.width - enemy.width * 1.1;
			enemy.y = enemy.height * 0.1;
			add(enemy);
		}
		
		private function drawEnemyStats():void
		{
			enemyStats = getStatsAsText(enemy);
			Text(enemyStats.children[0]).color = 0;
			for (var i:int = 0; i < enemyStats.count; i++)
			{
				var t:Text = Text(enemyStats.children[i]);
				t.x = enemy.x - t.width - 25;
				t.y = i * t.height;
				addGraphic(t);
			}
		}
		
		private function drawEnemyHealthbar():void
		{
			enemyHealthbar = new Graphiclist(drawHealthBar(enemy));
			enemyHealthbar.x = enemyStats.children[0].x - Canvas(enemyHealthbar.children[0]).width;//
			addGraphic(enemyHealthbar);
		}
		
		private function drawPlayer():void
		{
			player = new EntityFighter(Main.player);
			player.x = player.width * 0.1;
			player.y = FP.height - player.height * 1.1;
			player.player = true;
			add(player);
		}
		
		private function drawPlayerStats():void
		{
			playerStats = getStatsAsText(player);
			Text(playerStats.children[0]).color = 0;
			for (var i:int = 0; i < playerStats.count; i++)
			{
				var t:Text = playerStats[i];
				t.x = player.x + player.width + 25;
				t.y = i * t.height + player.y;
				if (t.text == "energy")
				addGraphic(t);
			}
		}
		
		private function drawPlayerHealthbar():void
		{
			playerHealthbar = new Graphiclist(drawHealthBar(player));
			playerHealthbar.x = Text(playerStats.children[0]).x + Text(playerStats.children[0]).width;
			playerHealthbar.y = Text(playerStats.children[0]).y;
			addGraphic(playerHealthbar);
		}
		
		private function drawMovesTitle():void
		{
			move = new Text("Moves");
			move.size *= 1.5;
			move.color = 0;
			move.x = playerHealthbar.x + Canvas(playerHealthbar.children[0]).width + 5;
			move.y = player.y;
			addGraphic(move);
		}
		
		private function drawMoves():void
		{
			moves = getMovesAsText(player);
			for (var i:int = 0; i < moves.count; i++)
			{
				var t:Text = Text(moves.children[i]);
				t.size = move.size;
				t.color = 0xFFFF00;
				t.x = move.x;
				t.y = t.textHeight * i + player.y + move.textHeight;
			}
			addGraphic(moves);
		}
		
		private function drawHealthBar(e:EntityFighter):Canvas
		{
			var c:Canvas = new Canvas(100, 20);
			c.drawRect(new Rectangle(0, 0, c.width, c.height), 0x000000);
			c.fill(new Rectangle(1, 1, c.width - 2, c.height - 2), 0xFF0000);
			c.fill(new Rectangle(1, 1, c.width * e.getHealth() / e.getMaxHealth() - 2, c.height - 2), 0x00FF00);
			return c;
		}
	
	}
}