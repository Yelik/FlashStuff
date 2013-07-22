package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		static public const FULL_SEED_MODE:int = 1, ROTATING_NOISE_MODE:int = 2, DEFAULT_MODE:int = 0;
		private var seed:int, bitmap:Bitmap, iters:int, octives:int, colors:int, mode:int, rotating:Boolean;
		
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
			regenSeed()
			iters = 1;
			octives = 3;
			colors = 7;
			mode = 0;
			rotating = false;
			bitmap = new Bitmap();
			addChild(bitmap);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}
		
		private function regenSeed():void
		{
			seed = Math.random() * 0xFFFFFF;
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.SPACE: 
					if (mode == DEFAULT_MODE || mode == FULL_SEED_MODE)
					{
						regenBitmap();
						return;
					}
					else if (mode == ROTATING_NOISE_MODE)
					{
						rotating = !rotating;
						addEventListener(Event.ENTER_FRAME, enterFrame);
						return;
					}
					break;
				
				case Keyboard.Q: 
					iters++;
					displayStats();
					break;
				
				case Keyboard.W: 
					iters--;
					displayStats();
					break;
				
				case Keyboard.ENTER: 
					regenSeed();
					if (mode == DEFAULT_MODE || mode == ROTATING_NOISE_MODE)
					{
						displayStats();
					}
					break;
				
				case Keyboard.Z: 
					colors++;
					displayStats();
					break;
				
				case Keyboard.X: 
					colors--;
					displayStats();
					break;
				
				case Keyboard.A: 
					octives++;
					displayStats();
					break;
				
				case Keyboard.S: 
					octives--;
					if (octives < 0)
						octives = 0;
					displayStats();
					break;
				
				case Keyboard.BACKSPACE: 
					mode = FULL_SEED_MODE;
					trace("full seed mode");
					break;
				
				case Keyboard.DELETE: 
					mode = ROTATING_NOISE_MODE;
					trace("rotating noise mode");
					break;
				
				case Keyboard.BACKSLASH: 
					mode = DEFAULT_MODE;
					trace("default mode");
					break;
				
				default: 
					trace("invalid key " + e.keyCode);
			}
			if (mode != ROTATING_NOISE_MODE)
			{
				rotating = false;
			}
			if (mode == FULL_SEED_MODE)
			{
				iters = seed % 50;
				octives = seed % 10;
				colors = seed % 110 - 55;
				displayStats();
			}
			if (octives < 0)
				octives = 0;
		}
		
		private function displayStats():void
		{
			trace("iters " + iters, "octives " + octives, "colors " + colors, "seed " + seed);
		}
		
		private function enterFrame(e:Event):void
		{
			if (rotating)
			{
				rotatingNoise();
			}
			else
			{
				removeEventListener(Event.ENTER_FRAME, enterFrame);
			}
		}
		
		private function regenBitmap():void
		{
			trace("generating");
			bitmap.bitmapData = generateAverageNoise(stage.stageWidth, stage.stageHeight, iters, octives, colors, seed);
			trace("done");
		}
		
		private function generateAverageNoise(width:int, height:int, iterations:int, octaves:int, colors:int, baseSeed:int):BitmapData
		{
			var data:BitmapData = new BitmapData(width, height), datalist:Vector.<BitmapData> = new Vector.<BitmapData>;
			for (var i:int = 0; i < iterations; i++)
			{
				data.perlinNoise(800, 600, octives, i + baseSeed, true, true, colors);
				datalist.push(data.clone());
			}
			
			for (var x:int = 0; x < data.width; x++)
			{
				for (var y:int = 0; y < data.height; y++)
				{
					var i2:int = 0;
					for (i = 0; i < iterations; i++)
					{
						i2 += datalist[i].getPixel(x, y);
					}
					data.setPixel(x, y, i2 / iterations);
				}
			}
			return data;
		}
		
		private function rotatingNoise():void
		{
			seed++;
			displayStats();
			regenBitmap();
		}
	}
}