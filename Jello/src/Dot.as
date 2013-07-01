package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Dot extends Bitmap
	{
		private var connects:Array, speeds:Array, lines:Shape, spacing:int, color:int, parentEntity:Entity, repulseStrength:int, id:int, size:int;
		
		public function Dot(x:int, y:int, parent:Entity, id:int)
		{
			this.id = id;
			size = 1;
			//size += id / 10;
			this.spacing = parent.getSpacing();
			this.color = parent.getColor();
			this.repulseStrength = parent.getRepluseStrength();
			this.parentEntity = parent;
			this.x = x;
			this.y = y;
			lines = new Shape();
			speeds = [0, 0];
			bitmapData = new BitmapData(size, size, false, color);
			connects = [];
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event = null):void
		{
			var a:Array = [0, 0], a2:Array = [0, 0], a3:Array = [0, 0], a4:Array = [0, 0];
			if (lines.parent == null)
			{
				if (parent != null)
					parent.addChild(lines);
			}
			lines.graphics.clear();
			lines.graphics.lineStyle(1, color);
			lines.graphics.moveTo(x + (size / 2), y + (size / 2));
			var xs:Array = [], ys:Array = [];
			for each (var d:Dot in connects)
			{
				xs.push(d.x);
				ys.push(d.y);
				lines.graphics.lineTo(d.x + (size / 2), d.y + (size / 2));
				if (AdvMath.distance(x, y, d.x, d.y) < spacing)
				{
					speeds = AdvMath.moveAtTarget([x, y], [d.x, d.y], -repulseStrength);
				}
			}
			var tarX:Number = AdvMath.ave(xs), tarY:Number = AdvMath.ave(ys), dis:int = AdvMath.distance(x, y, tarX, tarY);
			a = AdvMath.moveAtTarget([x, y], [tarX, tarY], dis);
			for each (var entity:Entity in Main.entities)
			{
				if (entity != parentEntity)
				{
					var eCent:Array = entity.getCenter(), a5:Array = AdvMath.moveAtTarget([x, y], [eCent[0], eCent[1]], -1.5);
					/*if (id % 25 == 0)
					{
						a5 = AdvMath.moveAtTarget([x, y], [eCent[0], eCent[1]], 5);
					}*/
					a2[0] += a5[0];
					a2[1] += a5[1];
					/*for each (d in entity.getDots())
					   {
					   if (hitTestPoint(d.x, d.y))
					   {
					   var a6:Array = AdvMath.moveAtTarget([x, y], eCent, -parentEntity.getDots().length);
					   speeds[0] += a6[0];
					   speeds[1] += a6[1];
					   }
					 }*/
				}
			}
			var cent:Array = parentEntity.getCenter();
			a3 = AdvMath.moveAtTarget([x, y], cent, -1);
			a4 = AdvMath.moveAtTarget([x, y], [Main.i.stage.stageWidth / 2, Main.i.stage.stageHeight / 2], AdvMath.distance(x, y, Main.i.stage.stageWidth / 2, Main.i.stage.stageHeight / 2) / 75);
			/*if (id % 25 == 0)
			{
				a4 = AdvMath.moveAtTarget([x, y], [Main.i.stage.stageWidth / 2, Main.i.stage.stageHeight / 2], AdvMath.distance(x, y, Main.i.stage.stageWidth / 2, Main.i.stage.stageHeight / 2) / 10);
			}*/
			x += speeds[0] + a[0] + a2[0] + a3[0] + a4[0];
			y += speeds[1] + a[1] + a2[1] + a3[1] + a4[1];
		}
		
		public function setConnects(connects:Array = null):void
		{
			this.connects = connects;
			for each (var d:Dot in connects)
			{
				if (d == null)
				{
					connects.splice(connects.indexOf(d), 1);
				}
			}
		}
		
		public function setPos(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}
	}
}