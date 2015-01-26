package screens
{
	import Animaatiot_fla.karhu_animaatio_1;
	
	import UIelements.Button;
	import UIelements.QuizWindow;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import myEvents.MovieclipEvent;
	
	import utility.ScreenHandler;
	
	public class Metsa extends Sprite
	{
		private const ANIM_AMOUNT:int = 5;
		
		private var gamePaused:Boolean = false;
		private var countFrames:int = 0;
		
		private var activeAnimals:Array = new Array();
		
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
			
			for(var i:int = 0; i < ANIM_AMOUNT; i++)
				activeAnimals.push(false);
			
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
			
			karhu.stop();
			karhu.stop();
			snail.stop();
			bat.stop();
			kettu.stop();
			rabbit.stop();
			
			karhu.karhu_mc.addEventListener(Event.ENTER_FRAME, checkPlayState);
			karhu.addEventListener(Event.ENTER_FRAME, checkPlayState);
			snail.addEventListener(Event.ENTER_FRAME, checkPlayState);
			bat.addEventListener(Event.ENTER_FRAME, checkPlayState);
			kettu.addEventListener(Event.ENTER_FRAME, checkPlayState);
			rabbit.addEventListener(Event.ENTER_FRAME, checkPlayState);
			
			this.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		protected function checkPlayState(event:Event):void
		{
			if(event.target.isPlaying)
			{
				if(event.target.currentFrame == event.target.totalFrames)
				{
					event.target.stop();
				}
			}
		}
		
		protected function gameLoop(event:Event):void
		{
			if(!gamePaused)
			{
				if(countFrames > 5*30)
				{
					countFrames = 0;
					
					activateAnimal();
				}
				
				countFrames++;
			}
		}
		
		private function activateAnimal():void
		{
			var isPlaying:Boolean = false;
			
			do{
				var rand:int = Math.floor(Math.random()*5);
				isPlaying = false;
				switch(rand)
				{
					case 0:
						if(karhu.isPlaying)
							isPlaying = true;
						else
							karhu.play();
						
						break;
					case 1:
						if(snail.isPlaying)
							isPlaying = true;
						else
							snail.play();
						
						break;
					case 2:
						if(bat.isPlaying)
							isPlaying = true;
						else
							bat.play();
						
						break;
					case 3:
						if(rabbit.isPlaying)
							isPlaying = true;
						else
							rabbit.play();
						
						break;
					case 4:
						if(kettu.isPlaying)
							isPlaying = true;
						else
							kettu.play();
						
						break;
					default:
						break;
				}
			}while(isPlaying);
		}
		
		protected function clickRabbit(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Met-sae-jae-nis", go, myStage);
			this.addChild(popup);
		}
		
		protected function clickKettu(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Ket-tu", go, myStage);
			this.addChild(popup);
		}
		
		protected function clickKarhu(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Kar-hu", go, myStage);
			this.addChild(popup);
		}
		
		protected function clickSnail(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("E-ta-na", go, myStage);
			this.addChild(popup);
		}
		
		protected function clickBat(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Le-pak-ko", go, myStage);
			this.addChild(popup);
		}
		
		private function go(event:MouseEvent):void
		{
			this.removeChild(popup);
			
			if(activeAnimals[0])
			{
				activeAnimals[0] = false;
				karhu.karhu_mc.stop();
				karhu.stop();
				karhu.karhu_mc.mouseEnabled = true;
				karhu.mouseEnabled = true;
			}
			if(activeAnimals[1])
			{
				activeAnimals[1] = false;
				snail.stop();
				snail.mouseEnabled = true;
			}
			if(activeAnimals[2])
			{
				activeAnimals[2] = false;
				bat.stop();
				bat.mouseEnabled = true;
			}
			if(activeAnimals[3])
			{
				activeAnimals[3] = false;
				rabbit.stop();
				rabbit.mouseEnabled = true;
			}
			if(activeAnimals[4])
			{
				activeAnimals[4] = false;
				kettu.stop();
				kettu.mouseEnabled = true;
			}
			
			gamePaused = false;
		}
		
		private function pause():void
		{
			if(karhu.isPlaying)
			{
				activeAnimals[0] = true;
				karhu.karhu_mc.stop();
				karhu.stop();
				karhu.karhu_mc.mouseEnabled = false;
				karhu.mouseEnabled = false;
			}
			if(snail.isPlaying)
			{
				activeAnimals[1] = true;
				snail.stop();
				snail.mouseEnabled = false;
			}
			if(bat.isPlaying)
			{
				activeAnimals[2] = true;
				bat.stop();
				bat.mouseEnabled = false;
			}
			if(rabbit.isPlaying)
			{
				activeAnimals[3] = true;
				rabbit.stop();
				rabbit.mouseEnabled = false;
			}
			if(kettu.isPlaying)
			{
				activeAnimals[4] = true;
				kettu.stop();
				kettu.mouseEnabled = false;
			}
			
			gamePaused = true;
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