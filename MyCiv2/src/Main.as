package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var map:Map;
		private var textFields:Vector.<TextField>
		private var spacer:int = 10;
		
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
			map = new Map(3);
			stage.addEventListener(KeyboardEvent.KEY_UP, stage_keyUp);
			textFields = new Vector.<TextField>
			draw();
		}
		
		private function draw():void
		{
			var width:int = stage.stageWidth / map.getSize();
			var height:int = stage.stageHeight / map.getSize();
			this.graphics.lineStyle(1);
			
			var i:int = 0;
			for (var i2:int = 0; i2 < (spacer * map.getSize() * map.getSize()); i2++)
			{
				textFields.push(null);
			}
			for (var x:int = 0; x < map.getSize(); x++)
			{
				for (var y:int = 0; y < map.getSize(); y++)
				{
					var tf1:TextField = textFields[i * spacer + 0] = makeTf(x, y, width, height);
					var tf2:TextField = textFields[i * spacer + 1] = makeTf(x, y, width, height);
					var tf3:TextField = textFields[i * spacer + 2] = makeTf(x, y, width, height);
					var tf4:TextField = textFields[i * spacer + 3] = makeTf(x, y, width, height);
					var tf5:TextField = textFields[i * spacer + 4] = makeTf(x, y, width, height);
					
					if (x == map.getCenter()[0] && y == map.getCenter()[1])
					{
						graphics.beginFill(0x999999);
						tf1.text = "City Pop " + getCity().getPop();
						tf2.y = y * height + tf1.height;
						tf2.text = "Homeless " + getCity().getHomeless();
						tf3.y = y * height + tf1.height + tf2.height;
						tf3.text = "House Builders " + getCity().getBuilders();
						tf4.y = y * height + tf1.height + tf2.height + tf3.height;
						tf4.text = "Road Builders " + getCity().getRoadBuilders();
						tf5.y = y * height + tf1.height + tf2.height + tf3.height + tf4.height;
						tf5.text = "Food " + getCity().getFoodProd();
					}
					else
					{
						graphics.beginFill(0x7CFC29);
						tf1.text = "Woods " + map.getAt([x, y]).getWood();
						tf2.y = y * height + tf1.height;
						tf2.text = "Farmers " + map.getAt([x, y]).getFarmers();
						tf3.y = y * height + tf1.height + tf2.height;
						tf3.text = "Woodcutters " + map.getAt([x, y]).getWooders();
					}
					graphics.drawRect(x * width, y * height, width, height);
					i++;
				}
			}
			for each (var tf:TextField in textFields)
			{
				try
				{
					addChild(tf);
				}
				catch (err:Error)
				{
					
				}
			}
		
		}
		
		private function makeTf(x:int, y:int, width:int, height:int, hShift:int = 0, vShift:int = 0):TextField
		{
			var textField:TextField = new TextField();
			textField.x = x * width;
			textField.y = y * height;
			textField.autoSize = "left";
			return textField;
		}
		
		private function redraw():void
		{
			var i:int = 0;
			
			for (var x:int = 0; x < map.getSize(); x++)
			{
				for (var y:int = 0; y < map.getSize(); y++)
				{
					var tf1:TextField = textFields[i * spacer + 0];
					var tf2:TextField = textFields[i * spacer + 1];
					var tf3:TextField = textFields[i * spacer + 2];
					var tf4:TextField = textFields[i * spacer + 3];
					var tf5:TextField = textFields[i * spacer + 4];
					if (x == map.getCenter()[0] && y == map.getCenter()[1])
					{
						tf1.text = "City Pop " + getCity().getPop();
						tf2.text = "Homeless " + getCity().getHomeless();
						tf3.text = "House Builders " + getCity().getBuilders();
						tf4.text = "Road Builders " + getCity().getRoadBuilders();
						tf5.text = "Food " + getCity().getFood();
					}
					else
					{
						tf1.text = "Woods " + map.getAt([x, y]).getWood().toFixed();
						tf2.text = "Farmers " + map.getAt([x, y]).getFarmers().toFixed();
						tf3.text = "Woodcutters " + map.getAt([x, y]).getWooders().toFixed();
					}
					i++;
				}
			}
		}
		
		private function stage_keyUp(e:KeyboardEvent):void
		{
			map.turn();
			redraw();
		}
		
		private function getCity():City
		{
			return City(map.getAt(map.getCenter()));
		}
	
	}

}