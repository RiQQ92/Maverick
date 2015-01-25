package screens
{
	import UIelements.Button;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import utility.ScreenHandler;
	
	public class CreditScreen extends Sprite
	{
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		
		public var exitBtn:Button = new Button("TakaisinNappi");
		public var credits:Bitmap = new Bitmap;
		
		public function CreditScreen(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			myStage = _stage;
			screenHandler = scrnHandle;
			
			exitBtn.addListener(
				function(event:MouseEvent):void
				{
					Assets.cameFromCredits = true;
					screenHandler.inScreen = "menu";
				}
			);
			
			exitBtn.scaleX = 0.5;
			exitBtn.scaleY = 0.5;
			exitBtn.x = 100;
			exitBtn.y = 480-(exitBtn.height*2);
			
			credits = Assets.getTexture("CreditsBG");
			
			draw();
		}
		
		private function draw():void
		{
			this.addChild(credits);
			this.addChild(exitBtn);
		}		
		
		public function Destruct():void
		{
			this.removeChild(credits);
			this.removeChild(exitBtn);
		}
	}
}