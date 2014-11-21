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
		
		public var speed:Number;
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
		}
		
		public function update():void
		{
			if (!disabled)
			{
				if (koukku.y > 235 && koukku.y < 685)
				{
					siima.y += speed;
					koukku.y += speed;
				}
				else
				{
					if (koukku.y <= 235)
					{
						speed = 0;
						siima.y += 2;
						koukku.y += 2;
					}
					if (koukku.y >= 685)
					{
						speed = 0;
						siima.y -= 2;
						koukku.y -= 2;
					}
				}
			}
			else
			{
				speed = 0;
			}
		}
		
	}
}