package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		private var rewinding:Boolean = false;
		private var backwards:Boolean = true;
		public var kortti:Bitmap;
		public var tausta:Bitmap;
		public var labyBtn:Bitmap;
		public var metsaBtn:Bitmap;
		public var muistiBtn:Bitmap;
		
		public function Minioppi()
		{
			tausta = Assets.getTexture("Tausta");
			tausta.scaleX = 1;
			tausta.scaleY = 1;
			this.addChild(tausta);
			/*
			labyBtn = Assets.getTexture("LabyBtn");
			labyBtn.scaleX = 0.3;
			labyBtn.scaleY = 0.3;
			labyBtn.x = stage.stageWidth/2 - labyBtn.width/2;
			labyBtn.y = stage.stageHeight/2 - labyBtn.height/2;
			this.addChild(labyBtn);
			*/
			kortti = Assets.getTexture("LehtiBack");
			kortti.scaleX = 1;
			kortti.scaleY = 1;
			kortti.x = stage.stageWidth/2 - kortti.width/2;
			kortti.y = stage.stageHeight/2 - kortti.height/2;
			kortti.addEventListener(Event.ENTER_FRAME, loopCard);
			this.addChild(kortti);
			
			metsaBtn = Assets.getTexture("MetsaBtn");
			metsaBtn.scaleX = 0.3;
			metsaBtn.scaleY = 0.3;
			metsaBtn.x = stage.stageWidth/5 - metsaBtn.width/2;
			metsaBtn.y = stage.stageHeight/2 - metsaBtn.height/2;
			this.addChild(metsaBtn);
			
			muistiBtn = Assets.getTexture("MuistiBtn");
			muistiBtn.scaleX = 0.3;
			muistiBtn.scaleY = 0.3;
			muistiBtn.x = (stage.stageWidth -stage.stageWidth/5) - muistiBtn.width/2;
			muistiBtn.y = stage.stageHeight/2 - muistiBtn.height/2;
			this.addChild(muistiBtn);
		}
		
		public function loopCard(event:Event):void
		{
			if(backwards)
			{
				if(!rewinding)
				{
					kortti.scaleX -= 0.05;
					if(kortti.scaleX <= 0)
					{
						kortti.bitmapData = Assets.getTexture("LehtiFront").bitmapData;
						rewinding = !rewinding;
						backwards = !backwards;
					}
				}
				else
				{
					kortti.scaleX += 0.05;
					if(kortti.scaleX >= 1)
						rewinding = !rewinding;
				}
			}
			else
			{
				if(!rewinding)
				{
					kortti.scaleX -= 0.05;
					if(kortti.scaleX <= 0)
					{
						kortti.bitmapData = Assets.getTexture("LehtiBack").bitmapData;
						rewinding = !rewinding;
						backwards = !backwards;
					}
				}
				else
				{
					kortti.scaleX += 0.05;
					if(kortti.scaleX >= 1)
						rewinding = !rewinding;
				}
			}
			
			kortti.x = stage.stageWidth/2 - kortti.width/2;
			kortti.y = stage.stageHeight/2 - kortti.height/2;
		}
	}
}