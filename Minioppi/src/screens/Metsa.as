package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	import UIelements.QuizWindow;
	import UIelements.ScoreWindow;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utility.CountTime;
	import utility.ScreenHandler;
	import utility.Time;
	
	public class Metsa extends Sprite
	{
		private const ANIM_AMOUNT:int = 6;
		
		private var karhuPaused:Boolean = false;
		private var gamePaused:Boolean = false;
		private var firstStart:Boolean = true;
		
		private var animsFound:int = 0;
		private var countFrames:int = 0;
		
		private var activeAnimals:Array;
		private var score:ScoreWindow;
		private var time:CountTime;
		private var endTime:Time = new Time(0, 0, 45, 0);
		
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		private var popup:QuizWindow;
		
		private var ohje:OhjeIkkuna = new OhjeIkkuna("OhjeMetsa");
		private var exit:Button = new Button("TakaisinNappi");
		private var bg:Bitmap = Assets.getTexture("Metsa_bg");
		
		private var siili:Siili = new Siili();
		private var karhu:Karhu = new Karhu();
		private var bat:Lepakko = new Lepakko();
		private var snail:etanaAnimoitu = new etanaAnimoitu();
		private var rabbit:Rabbit = new Rabbit();
		private var kettu:Kettu = new Kettu();
		
		public function Metsa(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			Assets.setBGMVolume(0.5);
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			Draw();
			Initialize();
		}
		
		private function Initialize():void
		{
			activeAnimals = new Array();
			
			for(var i:int = 0; i < ANIM_AMOUNT; i++)
				activeAnimals.push(false);
			
			kettu.buttonMode = true;
			kettu.addEventListener(MouseEvent.MOUSE_DOWN, clickKettu);
			
			siili.buttonMode = true;
			siili.addEventListener(MouseEvent.MOUSE_DOWN, clickSiili);
			
			rabbit.mouseChildren = false;
			rabbit.buttonMode = true;
			rabbit.addEventListener(MouseEvent.MOUSE_DOWN, clickRabbit);
			
			karhu.x = 370;
			karhu.y = 250;
			karhu.karhu_mc.buttonMode = true;
			karhu.karhu_mc.addEventListener(MouseEvent.MOUSE_DOWN, clickKarhu);
			
			snail.x = 320
			snail.y = 240;
			snail.mouseChildren = false;
			snail.buttonMode = true;
			snail.addEventListener(MouseEvent.MOUSE_DOWN, clickSnail);
			
			bat.x = 320;
			bat.y = 245;
			bat.mouseChildren = false;
			bat.buttonMode = true;
			bat.addEventListener(MouseEvent.MOUSE_DOWN, clickBat);
			
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
			
			karhu.karhu_mc.gotoAndStop(1);
			karhu.gotoAndStop(1);
			snail.gotoAndStop(1);
			bat.gotoAndStop(1);
			kettu.gotoAndStop(1);
			siili.gotoAndStop(1);
			rabbit.gotoAndStop(1);
			
			karhu.karhu_mc.visible = false;
			karhu.visible = false;
			snail.visible = false;
			bat.visible = false;
			rabbit.visible = false;
			kettu.visible = false;
			siili.visible = false;
			
			if(firstStart)
			{
				this.addChild(ohje);
				ohje.addEventListener(MouseEvent.CLICK, start);
			}
			else
			{
				var strScore:String = "";
				if(animsFound < 6)
				{
					strScore += "Löysit "+animsFound+" eläintä.";
				}
				else if(animsFound < 16)
				{
					strScore += "Heinoa! Löysit "+animsFound+" eläintä.";
				}
				else
				{
					strScore += "SUPER MAHTAVAA!\nLöysit "+animsFound+" eläintä.";
				}
				
				score = new ScoreWindow(strScore, start, myStage);
				time.Reset();
				this.addChild(score);
			}
			
		}
		
		protected function start(event:MouseEvent):void
		{
			animsFound = 0;
			time = new CountTime();
			
			if(!firstStart)
			{
				this.removeChild(score);
			}
			else
			{
				ohje.removeEventListener(MouseEvent.CLICK, start);
				this.removeChild(ohje);
			}
			
			firstStart = false;
			
			karhu.karhu_mc.addEventListener(Event.ENTER_FRAME, checkPlayState);
			karhu.addEventListener(Event.ENTER_FRAME, checkPlayState);
			snail.addEventListener(Event.ENTER_FRAME, checkPlayState);
			bat.addEventListener(Event.ENTER_FRAME, checkPlayState);
			kettu.addEventListener(Event.ENTER_FRAME, checkPlayState);
			siili.addEventListener(Event.ENTER_FRAME, checkPlayState);
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
					event.target.visible = false;
				}
			}
		}
		
		protected function gameLoop(event:Event):void
		{
			if(!gamePaused)
			{
				if(countFrames > 2*30)
				{
					countFrames = 0;
					
					activateAnimal();
				}
				
				countFrames++;
			}
			
			if(endTime.compareTimes(time.time))
			{
				gameFinish();
			}
		}
		
		private function gameFinish():void
		{
			this.removeEventListener(Event.ENTER_FRAME, gameLoop);
			
			Initialize();
		}
		
		private function activateAnimal():void
		{
			var isPlaying:Boolean = false;
			
			do{
				var rand:int = Math.floor(Math.random()*ANIM_AMOUNT);
				isPlaying = false;
				switch(rand)
				{
					case 0:
						if(karhu.isPlaying)
						{
							isPlaying = true;
						}
						else
						{
							karhu.play();
							karhu.visible = true;
							karhu.karhu_mc.visible = true;
							karhu.mouseChildren = true;
						}
						
						break;
					case 1:
						if(snail.isPlaying)
						{
							isPlaying = true;
						}
						else
						{
							snail.play();
							snail.visible = true;
						}
						
						break;
					case 2:
						if(bat.isPlaying)
						{
							isPlaying = true;
						}
						else
						{
							bat.play();
							bat.visible = true;
						}
						
						break;
					case 3:
						if(rabbit.isPlaying)
							isPlaying = true;
						else
						{
							rabbit.play();
							rabbit.visible = true;
						}
						
						break;
					case 4:
						if(kettu.isPlaying)
						{
							isPlaying = true;
						}
						else
						{
							kettu.play();
							kettu.visible = true;
						}
						
						break;
					
					case 5:
						if(siili.isPlaying)
						{
							isPlaying = true;
						}
						else
						{
							siili.play();
							siili.visible = true;
						}
						
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
		
		protected function clickSiili(event:MouseEvent):void
		{
			pause();
			popup = new QuizWindow("Sii-li", go, myStage);
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
			animsFound++;
			
			if(activeAnimals[0])
			{
				activeAnimals[0] = false;
				if(karhuPaused)
				{
					karhu.karhu_mc.play();
					karhuPaused = false;
				}
				
				karhu.mouseChildren = true;
				karhu.play();
				karhu.karhu_mc.mouseEnabled = true;
				karhu.mouseEnabled = true;
			}
			if(activeAnimals[1])
			{
				activeAnimals[1] = false;
				snail.play();
				snail.mouseEnabled = true;
			}
			if(activeAnimals[2])
			{
				activeAnimals[2] = false;
				bat.play();
				bat.mouseEnabled = true;
			}
			if(activeAnimals[3])
			{
				activeAnimals[3] = false;
				rabbit.play();
				rabbit.mouseEnabled = true;
			}
			if(activeAnimals[4])
			{
				activeAnimals[4] = false;
				kettu.play();
				kettu.mouseEnabled = true;
			}
			if(activeAnimals[5])
			{
				activeAnimals[5] = false;
				siili.play();
				siili.mouseEnabled = true;
			}
			
			gamePaused = false;
		}
		
		private function pause():void
		{
			if(karhu.isPlaying)
			{
				activeAnimals[0] = true;
				if(karhu.karhu_mc.isPlaying)
				{
					karhu.karhu_mc.stop();
					karhuPaused = true;
				}
				karhu.stop();
				karhu.mouseChildren = false;
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
			if(siili.isPlaying)
			{
				activeAnimals[5] = true;
				siili.stop();
				siili.mouseEnabled = false;
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
			this.addChild(siili);
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
			this.removeChild(siili);
			this.removeChild(rabbit);
		}
	}
}