package UIelements
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.ui.MouseCursor;
	import flash.ui.MouseCursorData;
	
	public class Button extends Sprite
	{
		private var mouseDown:Boolean = false;
		
		private var lightier:ColorTransform = new ColorTransform(1.2,1.2,1.2,1);
		private var darker:ColorTransform = new ColorTransform(0.8, 0.8, 0.8, 1);
		private var normal:BitmapData;
		
		private var image:Bitmap;
		private var clickFunc:Function;
		
		public function Button(imageName:String, highlights:Boolean = true)
		{
			super();
			
			if(highlights)
			{
				this.addEventListener(MouseEvent.ROLL_OVER, lighten);
				this.addEventListener(MouseEvent.ROLL_OUT, resetColor);
				this.addEventListener(MouseEvent.MOUSE_DOWN, darken);
				Assets.gameStage.addEventListener(MouseEvent.MOUSE_UP, mouseRelease);
			}
			
			image = Assets.getTexture(imageName);
			image.x = 0;
			image.y = 0;
			this.addChild(image);
			this.buttonMode = true;
			
			normal = image.bitmapData.clone();
		}
		
		protected function resetColor(evt:MouseEvent):void
		{
			image.bitmapData = normal.clone();
		}
		
		protected function mouseRelease(evt:MouseEvent):void
		{
			mouseDown = false;
			image.bitmapData = normal.clone();
			if(this.hitTestPoint(Assets.gameStage.mouseX, Assets.gameStage.mouseY))
				image.bitmapData.colorTransform(image.bitmapData.rect, lightier);
		}
		
		private function lighten(evt:MouseEvent):void
		{
			if(mouseDown)
			{
				image.bitmapData.colorTransform(image.bitmapData.rect, darker);
			}
			else
			{
				image.bitmapData.colorTransform(image.bitmapData.rect, lightier);
			}
		}
		
		private function darken(evt:MouseEvent):void
		{
			mouseDown = true;
			image.bitmapData.colorTransform(image.bitmapData.rect, darker);
		}
		
		public function updateImage(str:String):void
		{
			image.bitmapData = Assets.getTexture(str).bitmapData;
		}
		
		public function addListener(eventFunc:Function):void
		{
			clickFunc = eventFunc;
			this.addEventListener(MouseEvent.CLICK, clickFunc);
		}
		
		public function removeListeners():void
		{
			this.removeEventListener(MouseEvent.CLICK, clickFunc);
		}
	}
}