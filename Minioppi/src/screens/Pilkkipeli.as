package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	import UIelements.ScoreWindow;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import objects.Onki;
	import objects.PilkkiKalat;
	
	import utility.DebugText;
	import utility.ScreenHandler;
	import utility.TimerBar;
	
	public class Pilkkipeli extends Sprite
	{
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		private var exit:Button = new Button("TakaisinNappi");
		
		public var debug:DebugText;
		public var keyUp:Boolean;
		public var keyDown:Boolean;
		public var pause:Boolean = true;
		
		public var bg:Bitmap;
		public var ohje:OhjeIkkuna;
		public var nuoli:Button;
		
		public var onki:Onki;
		public var tKalat:Array;
		public var kalaList:Array;
		public var tipS:String = "";
		public var tip:Button;
		public var timer:TimerBar;
		
		public var kalaTimer:Number = 30;
		public var kalat:Array = new Array;
		public var kalaDir:Boolean = true;
		public var kalaRandom:int = 0;
		public var spawnTimer:int = 1.5;
		public var koukkuY:Number;
		public var pilkkiScore:ScoreWindow;
		
		public var tipTimer:int;
		public var timeUp:Boolean;
		
		public var fishes:int;
		
		public function Pilkkipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;
			screenHandler = scrnHandle;
			
			initialize();
		}
		
		private function initialize():void
		{
			tKalat = new Array();
			kalaList = new Array();
			
			tKalat.push("TAhven");
			tKalat.push("THauki");
			tKalat.push("TLahna");
			tKalat.push("TKuha");
			tKalat.push("TLohi");
			
			kalaList.push("Ahven");
			kalaList.push("Hauki");
			kalaList.push("Lahna");
			kalaList.push("Kuha");
			kalaList.push("Lohi");
			
			bg = Assets.getTexture("BGpilkkipeli");
			tipTimer = 0;
			
			//debug = new DebugText("", myStage);
			ohje = new OhjeIkkuna("OhjePilkki");
			nuoli = new Button("PilkkiNuoli");
			nuoli.scaleX = 0.7;
			nuoli.scaleY = 0.7;
			
			fishes = 0;
			
			this.addChild(bg);
			this.addChild(exit);
			exit.x = myStage.stageWidth-exit.width;
			exit.visible = false;
			this.addChild(ohje);
			ohje.addEventListener(MouseEvent.CLICK, skipIntro);
		}
		
		private function skipIntro(event:MouseEvent):void
		{
			ohje.removeEventListener(MouseEvent.CLICK, skipIntro);
			this.removeChild(ohje);
			
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
			
			// pelin aloitus
			tipS = getKalaTip();
			
			startGame();
		}
		
		private function startGame():void
		{
			timer = new TimerBar(true, 2, 0);
			timer.scaleX = 0.8;
			timer.scaleY = 0.8;
			timer.x = 640-timer.width;
			timer.y = 480-timer.height/2;
			this.addChild(timer);
			
			onki = new Onki();
			onki.x = 320;
			onki.y = -240;
			this.addChild(onki);
			showTip();
			nuoli.addListener(function():void
			{
				showTip();
				myStage.removeChild(nuoli);
				exit.visible = false;
				pause = true;
			});
			addListeners();
			//this.addChild(debug);
		}
		
		private function showTip():void
		{
			tip = new Button(tipS);
			tip.x = 320-(tip.width/2);
			tip.y = 240-(tip.height/2);
			tip.addListener(function():void
			{
				myStage.removeChild(tip);
				myStage.addChild(nuoli);
				exit.visible = true;
				pause = false;
			});
			myStage.addChild(tip);
		}
		
		private function addListeners():void
		{
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			if (timeUp)
			{
				myStage.removeEventListener(Event.ENTER_FRAME, update);
				pause = true;
				for (var j:int = 0; j<kalat.length; j++)
				{
					myStage.removeChild(kalat[j]);
				}
				this.removeChild(exit);
				myStage.removeChild(nuoli);
				this.removeChild(timer);
				pilkkiScore = new ScoreWindow("Sait pilkittyä " + fishes.toString() + " kalaa", function():void{initialize();}, myStage);
				this.addChild(pilkkiScore);
			}
			if (!pause)
			{
				tipTimer++;
				if (tipTimer >= 5*30)
				{
					timeUp = true;
				}
				timer.resume();
				if (tipTimer == 30*30 || tipTimer == 60*30 || tipTimer == 90*30)
				{
					tipS = getKalaTip();
					showTip();
					myStage.removeChild(nuoli);
					exit.visible = false;
					pause = true;
				}
				
				koukkuY = onki.koukku.y-230;
				if (onki.available)
				{
					checkHit();
				}
				else
				{
					checkReel();
				}
				Speed();
				onki.update();
				KalaSpawn();
				for (var i:int = 0; i<kalat.length; i++)
				{
					if (kalat[i].caught == false)
					{
						kalat[i].update();
					}
					else if (kalat[i].done != true)
					{
						kalat[i].caughtUpdate(koukkuY-kalat[i].y);
					}
					
					if (kalat[i].deleteGo == true)
					{
						myStage.removeChild(kalat[i]);
						kalat.splice(i, 1);
					}
				}
				debug.replace(fishes.toString());
			}
			else
			{
				timer.stop();
			}
		}
		
		private function checkReel():void
		{
			if (onki.koukku.y <= 260)
			{
				for (var i:int = 0; i<kalat.length; i++)
				{
					if (kalat[i].caught == true)
					{
						kalat[i].fishUp(kalat[i].x, kalat[i].y);
						onki.available = true;
						fishes ++;
					}
				}
			}
		}
		
		private function checkHit():void
		{
			var correct:String = kalaConvert(tipS);
			
			for (var i:int = 0; i<kalat.length; i++)
			{
				if (onki.koukkuHitBox.hitTestObject(kalat[i].hitBox))
				{
					if (kalat[i].kName == correct)
					{
						kalat[i].caught = true;
						onki.available = false;
						if (kalat[i].direction == true)
						{
							kalat[i].kala.rotation = 90;
							kalat[i].kala.x = 320-kalat[i].x+onki.koukku.width/2;
						}
						else
						{
							kalat[i].kala.rotation = -90;
							kalat[i].kala.x = 320-kalat[i].x-onki.koukku.width/2;
						}
					}
					else
					{
						kalat[i].waveSpeed = 70;
						kalat[i].speed = 40;
					}
				}
			}
		}
		
		private function KalaSpawn():void
		{
			if (kalaTimer <= 0)
			{
				var kala:PilkkiKalat = new PilkkiKalat(getKalaName(), kalaDir);
				kala.y = (Math.ceil(Math.random()*400)-1)+40;
				if (kalaDir)
				{
					kalaDir = false;
					kala.x = 740;
				}
				else
				{
					kalaDir = true;
					kala.x = -100;
				}
				kalat.push(kala);
				myStage.addChild(kala);
				kalaTimer = spawnTimer*30;
			}
			kalaTimer--;
		}
		
		private function getKalaName():String
		{
			var kalaName:String;
			kalaName = kalaList[Math.ceil(Math.random()*kalaList.length)-1];
			
			kalaName = kalaConvert(kalaName);
			
			if (kalaName == tipS)
			{
				kalaRandom = 0;
			}
			else
			{
				kalaRandom ++;
			}
			
			if (kalaRandom >= 5)
			{
				kalaName = tipS;
				kalaRandom = 0;
			}
			
			kalaName = kalaConvert(kalaName);
			return kalaName;
		}
		
		private function kalaConvert(name:String):String
		{
			var rName:String;
			
			for (var i:int = 0; i<kalaList.length; i++)
			{
				if (name == kalaList[i])
				{
					rName = tKalat[i];
				}
			}
			for (var j:int = 0; j<tKalat.length; j++)
			{
				if (name == tKalat[j])
				{
					rName = kalaList[j];
				}
			}
			return rName;
		}
		
		private function getKalaTip():String
		{
			var kala:String;
			
			if (tipS == "")
			{
				kala = tKalat[Math.ceil(Math.random()*tKalat.length)-1];
			}
			else
			{
				do
				{
					kala = tKalat[Math.ceil(Math.random()*tKalat.length)-1];
				}
				while (tipS == kala);
			}
			
			return kala;
		}
		
		private function Speed():void
		{
			if (keyDown)
			{
				if (onki.speed <= 7)
				{
					onki.speed += 1;
				}
			}
			if (keyUp)
			{
				if (onki.speed >= -7)
				{
					onki.speed -= 1;
				}
			}
			if (!keyUp && !keyDown)
			{
				if (onki.speed >= 0.5)
				{
					onki.speed -= 0.5;
				}
				if (onki.speed <= -0.5)
				{
					onki.speed += 0.5;
				}
			}
		}
		
		private function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					this.keyUp = true;
					break;
				
				case Keyboard.DOWN:
					this.keyDown = true;
					break;
				
			}
		}
		
		private function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					
					this.keyUp = false;
					break;
				case Keyboard.DOWN:
					
					this.keyDown = false;
					break;
				
			}
		}
		
		public function Destruct():void
		{
			myStage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.removeEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.removeEventListener(Event.ENTER_FRAME, update);
			myStage.removeChild(nuoli);
			
			kalat.forEach(removeFishes);
			kalat = new Array();
		}
		
		private function removeFishes(obj:*, index:*, arr:*):void
		{
			obj.removeChild(obj.kala);
			obj.removeChild(obj.hitBox);
		}
	}
}