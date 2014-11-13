package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import screens.Menu;
	import screens.Muistipeli;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		//private var rewinding:Boolean = false;
		//private var backwards:Boolean = true;
		
		//public var kortti:Bitmap;
		
		public var menu:Menu = new Menu(stage);
		public var muistipeli:Muistipeli = new Muistipeli();
		
		public var inScreen:String;
		
		public function Minioppi()
		{
			screenChange("menu");
			
			/*
			menu = new Menu(stage);
			menu.x = 0;
			menu.y = 0;
			this.addChild(menu);
			*/
			
			//menu.Destruct();
			//this.removeChild(menu);
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
		public function screenChange(screen:String):void
		{
			if (inScreen != null)
			{
				if (inScreen == "menu"){
					menu.Destruct();
				}
				if (inScreen == "muistipeli"){
					muistipeli.Destruct();
				}
			}
			
			if (screen == "menu")
			{
				menu.x = 0;
				menu.y = 0;
				this.addChild(menu);
				inScreen = screen;
			}
			if (screen == "muistipeli")
			{
				muistipeli.x = 0;
				muistipeli.y = 0;
				this.addChild(muistipeli);
				inScreen = screen;
			}
		}
	}
}