package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import objects.Maze;
	import objects.Player;
	
	import utility.ScreenHandler;
	
	public class Labyrintti extends Sprite
	{
		private var lab:Maze;
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		
		private var player:Player;
		private var takaisin:Button = new Button("Tausta");
		
		private var ohje:OhjeIkkuna = new OhjeIkkuna("OhjeLabyrintti");
		
		public function Labyrintti(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
		
			lab = new Maze(16, 12, myStage, false);
			this.addChild(lab);
			this.addChild(ohje);
			ohje.addEventListener(MouseEvent.CLICK, start);
		}
		
		private function start(evt:MouseEvent):void
		{
			ohje.removeEventListener(MouseEvent.CLICK, start);
			this.removeChild(ohje);
			
			player = new Player(myStage, this, lab);
			player.x = 0;
			player.y = 0;
			player.scaleX = 0.4;
			player.scaleY = 0.4;
			player.addListeners();
			this.addChild(player);
			
			this.addEventListener(Event.ENTER_FRAME, checkGoal);
		}
		
		private function checkGoal(event:Event):void
		{
			if(player.hitTestObject(lab.goal))
			{
				this.removeEventListener(Event.ENTER_FRAME, checkGoal);
				screenHandler.inScreen = "menu";
			}
		}
		
		public function Destruct():void
		{
			player.Destruct();
			this.removeChild(player);
		}
	}
}