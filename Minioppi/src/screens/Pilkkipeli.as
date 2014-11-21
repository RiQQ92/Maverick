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
	
	import utility.DebugText;
	import utility.ScreenHandler;
	
	public class Pilkkipeli extends Sprite
	{
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		public var debug:DebugText;
		public var keyUp:Boolean;
		public var keyDown:Boolean;
		public var pause:Boolean = true;
		
		public var bg:Bitmap;
		public var ohje:OhjeIkkuna;
		public var nuoli:Button;
		
		public var onki:Onki;
		public var TKalat:Array;
		public var tipS:String = "";
		public var tip:Button;
		
		public function Pilkkipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;
			screenHandler = scrnHandle;
			
			initialize();
		}
		
		private function initialize():void
		{
			bg = Assets.getTexture("BGpilkkipeli");
			ohje = new OhjeIkkuna("OhjePilkki");
			TKalat = new Array();
			getKalat();
			
			nuoli = new Button("PilkkiNuoli");
			nuoli.scaleX = 0.7;
			nuoli.scaleY = 0.7;
			
			this.addChild(bg);
			this.addChild(ohje);
			ohje.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(event:MouseEvent):void
		{
			ohje.removeEventListener(MouseEvent.CLICK, startGame);
			this.removeChild(ohje);
			// pelin aloitus
			tipS = getKalaTip();
			
			drawObjects();
			
		}
		
		private function drawObjects():void
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
				pause = true;
			});
			addListeners();
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
				Speed();
				onki.update();
			}
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

		private function getKalat():void
		{
			var TAhven:String = "TAhven";
			TKalat.push(TAhven);
			var THauki:String = "THauki";
			TKalat.push(THauki);
			var TLahna:String = "TLahna";
			TKalat.push(TLahna);
			var TKuha:String = "TKuha";
			TKalat.push(TKuha);
			var TLohi:String = "TLohi";
			TKalat.push(TLohi);
		}
		
		private function getKalaTip():String
		{
			var kala:String;
			
			if (tipS == "")
			{
				kala = TKalat[Math.ceil(Math.random()*TKalat.length)-1];
			}
			else
			{
				do
				{
					kala = TKalat[Math.ceil(Math.random()*TKalat.length)-1];
				}
				while (tipS == kala);
			}
			
			return kala;
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
			
		}
	}
}