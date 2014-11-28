package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MuistipeliButton extends Sprite
	{
		private var rewinding:Boolean = false;
		private var backwards:Boolean = true;
		private var isScaling:Boolean = false;
		private var timerOn:Boolean = false;
		
		private var scaleTimer:int = 0;
		private const SCALE_TIME:int = 45;
		private var scaleFactor:Number = 1;
		
		private var clickFunc:Function;
		private var image:Bitmap;
		
		public var backSide:Boolean = true;
		public var active:Boolean = true;
		public var flippingCard:Boolean = false;
		
		public var imageS:String;
		
		public var saveX:int;
		public var saveY:int;
		
		public function MuistipeliButton(imageName:String)
		{
			image = Assets.getTexture("LehtiBackCrop");
			imageS = imageName;
			image.scaleX = 0.4;
			image.scaleY = 0.4;
			saveX = image.width/2;
			saveY = image.height/2;
			image.x = -image.width/2+saveX;
			image.y = -image.height/2+saveY;
			this.addEventListener(Event.ENTER_FRAME, update);
			this.addChild(image);
		}
		
		public function flipCard():void
		{
			if (active == true)
			{
				if(backSide == true)
				{
					backSide = false;
					flippingCard = true;
				}
				else
				{
					this.active = false;
					backSide = true;
					flippingCard = true;
				}
				image.x = -image.width/2+saveX;
				image.y = -image.height/2+saveY;
			}
		}
		
		private function update(event:Event):void
		{
			if(scaleTimer > SCALE_TIME)
			{
				isScaling = false;
				timerOn = false;
				scaleTimer = 0;
			}
			
			if(timerOn)
			{
				scaleTimer++;
			}
			
			if(isScaling && scaleFactor < 1.5)
			{
				scaleFactor += 0.05;
			}
			else if(!isScaling && scaleFactor > 1)
			{
				scaleFactor -= 0.05;
				this.scaleY = scaleFactor;
				image.scaleX = 0.4 * scaleFactor;
				image.x = -image.width/2+saveX;
			}
			
			if(flippingCard)
			{
				if(backwards)
				{
					if(!rewinding)
					{
						image.scaleX -= 0.05 * scaleFactor;
						if(image.scaleX <= 0)
						{
							image.bitmapData = Assets.getTexture(imageS).bitmapData;
							rewinding = !rewinding;
							backwards = !backwards;
							isScaling = true;
							timerOn = true;
						}
					}
					else
					{
						image.scaleX += 0.05 * scaleFactor;
						if(image.scaleX >= 0.4 * scaleFactor)
						{
							rewinding = !rewinding;
							flippingCard = false;
							this.active = true;
						}
					}
				}
				else
				{
					if(!rewinding)
					{
						image.scaleX -= 0.05 * scaleFactor;
						if(image.scaleX <= 0)
						{
							image.bitmapData = Assets.getTexture("LehtiBackCrop").bitmapData;
							rewinding = !rewinding;
							backwards = !backwards;
						}
					}
					else
					{
						image.scaleX += 0.05 * scaleFactor;
						if(image.scaleX >= 0.4 * scaleFactor)
						{
							rewinding = !rewinding;
							flippingCard = false;
						}
					}
				}
				if(image.scaleX < 0)
					image.scaleX = 0;
					
				this.scaleY = scaleFactor;
				image.x = -image.width/2+saveX;
				image.y = -image.height/2+saveY;
			}
		}
		
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