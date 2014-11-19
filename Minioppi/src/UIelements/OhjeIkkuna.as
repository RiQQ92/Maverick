package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class OhjeIkkuna extends Sprite
	{
		public var image:Bitmap;
		public var event:Function;
		
		public function OhjeIkkuna(imageName:String)
		{
			image = Assets.getTexture(imageName);
			this.addChild(image);
		}
	}
}