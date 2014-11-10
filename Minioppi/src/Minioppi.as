package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		public var lehti:Bitmap;
		
		public function Minioppi()
		{
			lehti = Assets.getTexture("LehtiBack");
			this.addChild(lehti);
		}
	}
}