package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.sensors.Accelerometer;
	
	public class Onki extends Sprite
	{
		public var siima:Bitmap;
		public var koukku:Bitmap;
		
		public var speed:int;
		public var disabled:Boolean = false;
		
		public function Onki()
		{
			speed = 0;
			siima = Assets.getTexture("Siima");
			koukku = Assets.getTexture("Koukku");
			siima.x = -siima.width/2;
			koukku.x = -koukku.width/2;
			koukku.y = +siima.height;
			this.addChild(siima);
			this.addChild(koukku);
			speed = 0;
			this.addEventListener(Event.ENTER_FRAME, move);
		}
		
		private function move(event:Event):void
		{
			if (!disabled)
			{
				siima.y += speed;
				koukku.y += speed;
			}
		}
		
		private function changeSpeed(_speed:int):void
		{
			speed = _speed;
		}
		
	}
}