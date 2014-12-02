package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import utility.DebugText;
	
	public class PilkkiKalat extends Sprite
	{
		public var kName:String;
		public var kala:Bitmap;
		public var rotator:Number = 0;
		public var direction:Boolean;
		public var hitBox:Bitmap;
		
		public var waveSpeed:int = 3;
		public var waveDist:int = 20;
		public var speed:int = 3;
		
		public var yOffSet:Number;
		
		public var hit:Boolean = false;
		
		public function PilkkiKalat(kalaName:String, dir:Boolean)
		{
			hitBox = Assets.getTexture("HitBox");
			hitBox.scaleX = 0.5;
			hitBox.scaleY = 0.5;
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
						hitBox.x += kala.width/2-hitBox.width/2;
					} else {
						kala.scaleX = 0.4;
						hitBox.x -= kala.width/2+hitBox.width/2;
					}
					kala.scaleY = 0.4;
					yOffSet = hitBox.height*1.5;
					break;
				case "Ahven":
					if (!direction)
					{
						kala.scaleX = -0.2;
						hitBox.x += kala.width/2-hitBox.width/2;
					} else {
						kala.scaleX = 0.2;
						hitBox.x -= kala.width/2+hitBox.width/2;
					}
					kala.scaleY = 0.2;
					yOffSet = hitBox.height*2;
					break;
				case "Lohi":
					if (!direction)
					{
						kala.scaleX = -0.3;
						hitBox.x += kala.width/2-hitBox.width/2;
					} else {
						kala.scaleX = 0.3;
						hitBox.x -= kala.width/2+hitBox.width/2;
					}
					kala.scaleY = 0.3;
					yOffSet = hitBox.height*1.5;
					break;
				case "Kuha":
					if (!direction)
					{
						kala.scaleX = -0.325;
						hitBox.x += kala.width/2-hitBox.width/2;
					} else {
						kala.scaleX = 0.325;
						hitBox.x -= kala.width/2+hitBox.width/2;
					}
					kala.scaleY = 0.325;
					yOffSet = hitBox.height*1.5;
					break;
				case "Lahna":
					if (!direction)
					{
						kala.scaleX = -0.25;
						hitBox.x += kala.width/2-hitBox.width/2;
					} else {
						kala.scaleX = 0.25;
						hitBox.x -= kala.width/2+hitBox.width/2;
					}
					kala.scaleY = 0.25;
					yOffSet = hitBox.height*1.25;
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
			hitBox.y = Math.ceil(Math.sin(rotator/180*Math.PI)*waveDist)+yOffSet;
			if (!direction)
			{
				kala.x += speed;
				hitBox.x += speed;
			}
			else
			{
				kala.x -= speed;
				hitBox.x -= speed;
			}
		}
		
	}
}