package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Game extends Sprite
	{
		public static var i:Game, stopping:Boolean;
		
		public var player:EntityPlayer, keys:Array, cam:Array, entities:Array;
		
		public function Game()
		{
			i = this;
			keys = [false, false, false, false];
			cam = [0, 0];
			entities = [];
			stopping = false;
		}
		
		public function start():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, frame);
			
			var c:CelleMap = new CelleMap();
			c.setAt(1, 0, 2);
			c.setAt(0, 1, 2);
			c.setAt(0, 2, 2);
			c.setAt(1, 2, 2);
			c.setAt(2, 1, 2);
			c.setAt(2, 2, 2);
			c.setAt(1, 1, 3);
			
			player = new EntityPlayer(0, 0, c);
			
			c.setAt(1, 0, 2);
			c.setAt(0, 1, 2);
			c.setAt(0, 2, 2);
			c.setAt(1, 2, 2);
			c.setAt(2, 1, 2);
			c.setAt(2, 2, 2);
			c.setAt(1, 1, 3);
			
			new EntityBot(50, 50, c.clone());
			new EntityBot(50, 50, c.clone());
			new EntityBot(50, 50, c.clone());
			new EntityBot(50, 50, c.clone());
			
			var b:BitmapData = new BitmapData(10, 10, false, 0);
			
			new EntityDead(-50, 0, b.clone());
			new EntityDead(50, 0, b.clone());
			new EntityDead(0, -50, b.clone());
			new EntityDead(0, 50, b.clone());
		}
		
		public function frame(e:Event):void
		{
			if (Game.stopping)
			{
				trace("Stopping");
				return;
			}
			
			cam[0] = -player.x + (stage.stageWidth / 2);
			cam[1] = -player.y + (stage.stageHeight / 2);
		}
		
		public function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.RIGHT)
				keys[0] = false;
			else if (e.keyCode == Keyboard.UP)
				keys[1] = false;
			else if (e.keyCode == Keyboard.LEFT)
				keys[2] = false;
			else if (e.keyCode == Keyboard.DOWN)
				keys[3] = false;
		}
		
		public function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.RIGHT)
				keys[0] = true;
			else if (e.keyCode == Keyboard.UP)
				keys[1] = true;
			else if (e.keyCode == Keyboard.LEFT)
				keys[2] = true;
			else if (e.keyCode == Keyboard.DOWN)
				keys[3] = true;
		}
		
		public function tryToStop():void
		{
			if (!stopping)
				stop();
		}
		
		public function stop():void
		{
			for (var i:int = 0; i < entities.length; i++)
			{
				entities[i].die();
				entities[i] = null;
			}
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			removeEventListener(Event.ENTER_FRAME, frame);
			stopping = true;
			Game.i = null;
			Main.i.endGame();
		}
	}
}