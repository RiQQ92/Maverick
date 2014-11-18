package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MuistipeliButton extends Sprite
	{
		/*
		private var rewinding:Boolean = false;
		private var backwards:Boolean = true;
		*/
		private var clickFunc:Function;
		
		public var backSide:Boolean = true;
		
		public var active:Boolean = true;
		
		private var image:Bitmap;
		public var imageS:String
		
		public function MuistipeliButton(imageName:String)
		{
			image = Assets.getTexture("LehtiBack");
			imageS = imageName;
			image.scaleX = 0.4;
			image.scaleY = 0.4;
			image.x -= image.width/4;
			image.y -= image.height/4-20;
			this.addChild(image);
		}
		
		public function flipCard():void
		{
			if (active == true)
			{
				if(backSide == true)
				{
					image.bitmapData = Assets.getTexture(imageS).bitmapData;
					backSide = false;
				}
				else
				{
					image.bitmapData = Assets.getTexture("LehtiBack").bitmapData;
					backSide = true;
				}
			}
		}
		
		/*
		public function loopCard():void
		{
			if(backwards)
			{
				if(!rewinding)
				{
					image.scaleX -= 0.05;
					if(image.scaleX <= 0)
					{
						image.bitmapData = Assets.getTexture(imageS).bitmapData;
						rewinding = !rewinding;
						backwards = !backwards;
					}
				}
				else
				{
					image.scaleX += 0.05;
					if(image.scaleX >= 1)
						rewinding = !rewinding;
				}
			}
			else
			{
				if(!rewinding)
				{
					image.scaleX -= 0.05;
					if(image.scaleX <= 0)
					{
						image.bitmapData = Assets.getTexture("LehtiBack").bitmapData;
						rewinding = !rewinding;
						backwards = !backwards;
					}
				}
				else
				{
					image.scaleX += 0.05;
					if(image.scaleX >= 1)
						rewinding = !rewinding;
				}
			}
			
			image.x = stage.stageWidth/2 - image.width/2;
			image.y = stage.stageHeight/2 - image.height/2;
		}
		*/
		
		public function addListener(eventFunc:Function):void
		{
			clickFunc = eventFunc,
			this.addEventListener(MouseEvent.CLICK, eventFunc);
		}
		
		public function removeListeners():void
		{
			this.removeEventListener(MouseEvent.CLICK, clickFunc);
		}
		
	}
}