package screens
{
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
		public var keyUp:Boolean;
		public var keyDown:Boolean;
		
		public var bg:Bitmap;
		public var tip:OhjeIkkuna;
		
		public var debug:DebugText;
		
		public var onki:Onki;
		
		public function Pilkkipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;
			screenHandler = scrnHandle;
			
			initialize();
			
			debug = new DebugText("test", myStage);
		}
		
		private function initialize():void
		{
			bg = Assets.getTexture("BGpilkkipeli");
			tip = new OhjeIkkuna("OhjePilkki");
			drawScreen();
			tip.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(event:MouseEvent):void
		{
			tip.removeEventListener(MouseEvent.CLICK, startGame);
			this.removeChild(tip);
			// pelin aloitus
			drawObjects();
		}
		
		private function drawObjects():void
		{
			onki = new Onki();
			onki.x = myStage.width/2;
			onki.y = -myStage.height/2;
			this.addChild(onki);
			addListeners();
		}
		
		private function addListeners():void
		{
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.addEventListener(Event.ENTER_FRAME, Speed);
		}
		
		private function Speed(event:Event):void
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
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(tip);
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