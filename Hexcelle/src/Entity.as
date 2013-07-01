package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Entity
	{
		public var x:Number, y:Number, image:Sprite, speeds:Array, accel:Number, maxSpeed:Number, friction:Number;
		
		public function Entity(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			speeds = [0, 0];
			updateStats();
			
			image = new Sprite();
			
			Game.i.addChild(image);
			Game.i.entities.push(this);
			
			image.addEventListener(Event.ENTER_FRAME, frame);
		}
		
		public function frame(e:Event = null):void
		{
			if (Game.stopping)
				return;
			for (var i:int = 0; i < speeds.length; i++)
			{
				speeds[i] *= friction;
				if (speeds[i] > maxSpeed)
					speeds[i] = maxSpeed;
				if (speeds[i] < -maxSpeed)
					speeds[i] = -maxSpeed;
			}
			x += speeds[0];
			y += speeds[1];
			image.x = x + Game.i.cam[0];
			image.y = y + Game.i.cam[1];
		}
		
		public function die():void
		{
			if (image.parent != null)
				image.parent.removeChild(image);
			Game.i.entities.splice(Game.i.entities.indexOf(this), 1);
		}
		
		public function updateStats():void
		{
			accel = getAccel();
			maxSpeed = getMaxSpeed();
			friction = getFriction();
		}
		
		public function getFriction():Number
		{
			return 0.95;
		}
		
		public function getAccel():Number
		{
			return 1;
		}
		
		public function getMaxSpeed():Number
		{
			return 10;
		}
		
		public function getPos():Array
		{
			return [x, y];
		}
	}
}