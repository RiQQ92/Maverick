package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import utility.DebugText;
	
	public class PilkkiKalat extends Sprite
	{
		public var kName:String;
		private var kala:Bitmap;
		public var rotator:Number = 0;
		public var direction:Boolean;
		public var hitBox:Bitmap;
		
		public var waveSpeed:int = 2.5;
		public var waveDist:int = 20;
		
		public function PilkkiKalat(kalaName:String, dir:Boolean)
		{
			hitBox = Assets.getTexture("HitBox");
			direction = dir;
			kName = kalaName;
			kala = Assets.getTexture(kName);
			// ufitfiyrdutdrtd
			if (!direction)
			{
				kala.scaleX = -0.3;
			}
			else
			{
				kala.scaleX = 0.3;
			}
			// ohfihbaoibhsdviasjn
			switch (kName)
			{
				case "Hauki":
					if (!direction)
					{
						kala.scaleX = -0.4;
					} else {
						kala.scaleX = 0.4;
					}
					kala.scaleY = 0.4;
					break;
				case "Ahven":
					if (!direction)
					{
						kala.scaleX = -0.2;
					} else {
						kala.scaleX = 0.2;
					}
					kala.scaleY = 0.2;
					break;
				case "Lohi":
					if (!direction)
					{
						kala.scaleX = -0.3;
					} else {
						kala.scaleX = 0.3;
					}
					kala.scaleY = 0.3;
					break;
				case "Kuha":
					if (!direction)
					{
						kala.scaleX = -0.325;
					} else {
						kala.scaleX = 0.325;
					}
					kala.scaleY = 0.325;
					break;
				case "Lahna":
					if (!direction)
					{
						kala.scaleX = -0.25;
					} else {
						kala.scaleX = 0.25;
					}
					kala.scaleY = 0.25;
					break;
			}
			if (!direction)
			{
				kala.x = +kala.width/2;
			} else {
				kala.x = -kala.width/2;
			}
			this.addChild(kala);
			this.addChild(hitBox);
		}
		
		public function update():void
		{
			if (rotator >= (360-waveSpeed))
			{
				rotator = 0;
			}
			else
			{
				rotator += waveSpeed;
			}
			
			kala.y = Math.ceil(Math.sin(rotator/180*Math.PI)*waveDist);
			hitBox.y = Math.ceil(Math.sin(rotator/180*Math.PI)*waveDist);
			if (!direction)
			{
				kala.x += 3;
				hitBox.x += 3;
			}
			else
			{
				kala.x -= 3;
				hitBox.x -= 3;
			}
		}
		
	}
}