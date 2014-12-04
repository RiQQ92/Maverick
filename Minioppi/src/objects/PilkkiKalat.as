package objects
{
	import com.greensock.TweenLite;
	
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
		public var caught:Boolean = false;
		public var done:Boolean = false;
		
		public var deleteTimer:int = 0;
		public var deleteGo:Boolean = false;
		
		public function PilkkiKalat(kalaName:String, dir:Boolean)
		{
			hitBox = Assets.getTexture("HitBox");
			hitBox.scaleX = 3;
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
						hitBox.x += kala.width/2-hitBox.width;
					} else {
						kala.scaleX = 0.4;
						hitBox.x -= kala.width/2;
					}
					kala.scaleY = 0.4;
					yOffSet = hitBox.height*1.5;
					break;
				case "Ahven":
					if (!direction)
					{
						kala.scaleX = -0.2;
						hitBox.scaleX = 1.5;
						hitBox.x += kala.width/2-hitBox.width;
					} else {
						kala.scaleX = 0.2;
						hitBox.scaleX = 1.5;
						hitBox.x -= kala.width/2;
					}
					kala.scaleY = 0.2;
					yOffSet = hitBox.height*2;
					break;
				case "Lohi":
					if (!direction)
					{
						kala.scaleX = -0.3;
						hitBox.x += kala.width/2-hitBox.width;
					} else {
						kala.scaleX = 0.3;
						hitBox.x -= kala.width/2;
					}
					kala.scaleY = 0.3;
					yOffSet = hitBox.height*1.5;
					break;
				case "Kuha":
					if (!direction)
					{
						kala.scaleX = -0.325;
						hitBox.x += kala.width/2-hitBox.width;
					} else {
						kala.scaleX = 0.325;
						hitBox.x -= kala.width/2;
					}
					kala.scaleY = 0.325;
					yOffSet = hitBox.height*1.5;
					break;
				case "Lahna":
					if (!direction)
					{
						kala.scaleX = -0.25;
						hitBox.scaleX = 1.5;
						hitBox.x += kala.width/2-hitBox.width;
					} else {
						kala.scaleX = 0.25;
						hitBox.scaleX = 1.5;
						hitBox.x -= kala.width/2;
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
			
			if (!caught)
			{
				deleteTimer ++;
			}
			if (deleteTimer >= 10*30)
			{
				deleteGo = true;
			}
		}
		
		public function caughtUpdate(locY:Number):void
		{
			this.kala.y = locY;
			this.hitBox.y = locY;
		}
		
		public function fishUp(offSetX:int, offSetY:int):void
		{
			var oX:int = offSetX;
			var oY:int = offSetY;
			this.hitBox.y += -200;
			done = true;
			
			var loc:Object = {x:0, y:0, onComplete: goDelete};
			loc.x = this.kala.x;
			loc.y = this.kala.y-200;
			
			com.greensock.TweenLite.to(this.kala, 1, loc);
		}
		
		public function goDelete():void
		{
			deleteGo = true;
		}
		
	}
}