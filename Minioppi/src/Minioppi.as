package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import screens.Menu;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		//private var rewinding:Boolean = false;
		//private var backwards:Boolean = true;
		public var menu:Menu;
		
		//public var kortti:Bitmap;
		
		public function Minioppi()
		{
			menu = new Menu(stage);
			menu.x = 0;
			menu.y = 0;
			this.addChild(menu);
			
			menu.Destruct();
			this.removeChild(menu);
			/*
			kortti.scaleX = 1;
			kortti.scaleY = 1;
			kortti.x = stage.stageWidth/2 - kortti.width/2;
			kortti.y = stage.stageHeight/2 - kortti.height/2;
			kortti.addEventListener(Event.ENTER_FRAME, loopCard);
			this.addChild(kortti);
			*/
		}
		
		/*
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
		*/
	}
}