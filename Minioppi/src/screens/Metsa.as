package screens
{
	import Animaatiot_fla.karhu_animaatio_1;
	
	import UIelements.Button;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import utility.ScreenHandler;
	
	public class Metsa extends Sprite
	{
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		
		private var exit:Button = new Button("TakaisinNappi");
		private var bg:Bitmap = Assets.getTexture("Metsa_bg");
		private var karhu:karhu_animaatio_1 = new karhu_animaatio_1();
		private var bat:Lepakko = new Lepakko();
		private var snail:etanaAnimoitu = new etanaAnimoitu();
		private var rabbit:Rabbit = new Rabbit();
		private var kettu:Kettu = new Kettu();
		
		public function Metsa(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			myStage = _stage;
			screenHandler = scrnHandle;
			
			this.addChild(bg);
			this.addChild(exit);
			karhu.x = 370;
			karhu.y = 250;
			this.addChild(karhu);
			snail.x = 320
			snail.y = 240;
			this.addChild(snail);
			bat.x = 320;
			bat.y = 245;
			this.addChild(bat);
			this.addChild(kettu);
			this.addChild(rabbit);
			
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
		}
		
		public function Destruct():void
		{
			
		}
	}
}