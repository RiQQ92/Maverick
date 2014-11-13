package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Button extends Sprite
	{
		private var image:Bitmap;
		
		public function Button(imageName:String)
		{
			super();
			
			image = Assets.getTexture(imageName);
			image.x = 0;
			image.y = 0;
			this.addChild(image);
		}
		
		public function addListener(eventFunc:Function):void
		{
			this.addEventListener(MouseEvent.CLICK, eventFunc);
		}
		
		public function removeListeners():void
		{
			this.removeListeners();
		}
	}
}