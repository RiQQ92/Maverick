package screens
{
	import UIelements.OhjeIkkuna;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import utility.DebugText;
	import utility.ScreenHandler;
	
	public class Pilkkipeli extends Sprite
	{
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		
		public var bg:Bitmap;
		public var tip:OhjeIkkuna;
		
		public var debug:DebugText;
		
		public function Pilkkipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;
			screenHandler = scrnHandle;
			
			initialize();
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
			
		}
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(tip);
		}
		
		public function Destruct():void
		{
			
		}
	}
}