package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	
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
		
		public var kalaTimer:Number = 30;
		public var kalat:Array = new Array;
		public var kalaDir:Boolean = true;
		public var kalaRandom:int = 0;
		public var spawnTimer:int = 1.25;
		
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
			
			//debug = new DebugText("", myStage);
			ohje = new OhjeIkkuna("OhjePilkki");
			nuoli = new Button("PilkkiNuoli");
			nuoli.scaleX = 0.7;
			nuoli.scaleY = 0.7;
			
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
			onki = new Onki();
			onki.x = myStage.width/2;
			onki.y = -myStage.height/2;
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
			if (!pause)
			{
				checkHit();
				Speed();
				onki.update();
				KalaSpawn();
				for (var i:int = 0; i<kalat.length; i++)
				{
					kalat[i].update();
				}
			}
		}
		
		private function checkHit():void
		{
			for (var i:int = 0; i<kalat.length; i++)
			{
				if (onki.koukkuHitBox.hitTestObject(kalat[i].hitBox))
				{
					kalat[i].waveSpeed = 70;
					kalat[i].speed = 40;
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
					kala.x = 680;
				}
				else
				{
					kalaDir = true;
					kala.x = -40;
				}
				kalat.push(kala);
				myStage.addChild(kala);
				kalaTimer = spawnTimer*30;
			}
			else
			{
				kalaTimer -= 1;
			}
			
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