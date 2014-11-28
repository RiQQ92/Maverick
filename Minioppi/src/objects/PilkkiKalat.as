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
		
		public var waveSpeed:int = 2.5;
		public var waveDist:int = 20;
		
		public function PilkkiKalat(kalaName:String, dir:Boolean)
		{
			direction = dir
			kName = kalaName;
			kala = Assets.getTexture(kName);
			if (!direction)
			{
				kala.scaleX = -0.3;
			}
			else
			{
				kala.scaleX = 0.3;
			}
			kala.scaleY = 0.3;
			kala.x = -kala.width/2;
			kala.y = -kala.height/2;
			this.addChild(kala);
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
			if (!direction)
			{
				kala.x += 3;
			}
			else
			{
				kala.x -= 3;
			}
		}
		
	}
}