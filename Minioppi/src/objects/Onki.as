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
		public var koukkuHitBox:Bitmap;
		
		public var speed:Number;
		public var disabled:Boolean = false;
		
		public function Onki()
		{
			speed = 0;
			siima = Assets.getTexture("Siima");
			koukku = Assets.getTexture("Koukku");
			koukkuHitBox = Assets.getTexture("HitBox");
			
			koukkuHitBox.scaleX = 0.75;
			koukkuHitBox.scaleY = 0.75;
			siima.x = -siima.width/2;
			koukku.x = -koukku.width/2;
			koukku.y = +siima.height;
			koukkuHitBox.x = -koukkuHitBox.width/2;
			koukkuHitBox.y = +siima.height+koukkuHitBox.height;
			this.addChild(siima);
			this.addChild(koukku);
			this.addChild(koukkuHitBox);
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
					koukkuHitBox.y += speed;
				}
				else
				{
					if (koukku.y <= 235)
					{
						speed = 0;
						siima.y += 2;
						koukku.y += 2;
						koukkuHitBox.y += 2;
					}
					if (koukku.y >= 685)
					{
						speed = 0;
						siima.y -= 2;
						koukku.y -= 2;
						koukkuHitBox.y -= 2;
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