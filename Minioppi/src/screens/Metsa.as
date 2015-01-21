package screens
{
	import Animaatiot_fla.karhu_animaatio_1;
	
	import UIelements.Button;
	import UIelements.QuizWindow;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import utility.ScreenHandler;
	
	public class Metsa extends Sprite
	{
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		private var popup:QuizWindow;
		
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
			
			kettu.buttonMode = true;
			kettu.addEventListener(MouseEvent.MOUSE_DOWN, clickKettu);
			
			rabbit.mouseChildren = false;
			rabbit.buttonMode = true;
			rabbit.addEventListener(MouseEvent.MOUSE_DOWN, clickRabbit);
			
			karhu.x = 370;
			karhu.y = 250;
			karhu.karhu_mc.buttonMode = true;
			karhu.karhu_mc.addEventListener(MouseEvent.MOUSE_DOWN, clickKarhu);
			
			snail.x = 320
			snail.y = 240;
			snail.buttonMode = true;
			snail.addEventListener(MouseEvent.MOUSE_DOWN, clickSnail);
			
			bat.x = 320;
			bat.y = 245;
			bat.buttonMode = true;
			bat.addEventListener(MouseEvent.MOUSE_DOWN, clickBat);
			
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
			
			Draw();
		}
		
		protected function clickRabbit(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Jae-nis", go, myStage);
			this.addChild(popup);
			trace("rabbit got klikd");
		}
		
		protected function clickKettu(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Ket-tu", go, myStage);
			this.addChild(popup);
			trace("kettu got klikd");
		}
		
		protected function clickKarhu(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Kar-hu", go, myStage);
			this.addChild(popup);
			trace("karhu got klikd");
		}
		
		protected function clickSnail(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("E-ta-na", go, myStage);
			this.addChild(popup);
			trace("snail got klikd");
		}
		
		protected function clickBat(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Le-pak-ko", go, myStage);
			this.addChild(popup);
			trace("bat got klikd");
		}
		
		private function go(event:MouseEvent):void
		{
			this.removeChild(popup);
			
			karhu.karhu_mc.play();
			karhu.play();
			snail.play();
			bat.play();
			kettu.play();
			rabbit.play();
			
			karhu.karhu_mc.mouseEnabled = true;
			karhu.mouseEnabled = true;
			snail.mouseEnabled = true;
			bat.mouseEnabled = true;
			kettu.mouseEnabled = true;
			rabbit.mouseEnabled = true;
		}
		
		private function pause():void
		{
			karhu.karhu_mc.stop();
			karhu.stop();
			snail.stop();
			bat.stop();
			rabbit.stop();
			kettu.stop();
			
			karhu.karhu_mc.mouseEnabled = false;
			karhu.mouseEnabled = false;
			snail.mouseEnabled = false;
			bat.mouseEnabled = false;
			rabbit.mouseEnabled = false;
			kettu.mouseEnabled = false;
		}
		
		private function Draw():void
		{
			this.addChild(bg);
			
			this.addChild(exit);
			
			this.addChild(karhu);
			this.addChild(snail);
			this.addChild(bat);
			this.addChild(kettu);
			this.addChild(rabbit);
		}
		
		public function Destruct():void
		{
			this.removeChild(bg);
			
			this.removeChild(exit);
			
			this.removeChild(karhu);
			this.removeChild(snail);
			this.removeChild(bat);
			this.removeChild(kettu);
			this.removeChild(rabbit);
		}
	}
}