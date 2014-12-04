package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	import UIelements.ScoreWindow;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import objects.Maze;
	import objects.Player;
	
	import utility.CountTime;
	import utility.ScreenHandler;
	import utility.TimerBar;
	
	public class Labyrintti extends Sprite
	{
		private var score:ScoreWindow;
		private var timer:TimerBar;
		private var time:CountTime;
		
		private var firstStart:Boolean = true;
		
		private var lab:Maze;
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		
		private var player:Player;
		private var takaisin:Button = new Button("Tausta");
		
		private var ohje:OhjeIkkuna = new OhjeIkkuna("OhjeLabyrintti");
		private var exit:Button = new Button("TakaisinNappi");
		
		public function Labyrintti(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			exit.scaleX = 0.75;
			exit.scaleY = 0.75;
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
			
			Initialize();
		}
		
		private function Initialize():void
		{
			lab = new Maze(16, 12, myStage, false);
			this.addChild(lab);
			
			if(firstStart)
			{
				this.addChild(ohje);
			}
			else
			{
				score = new ScoreWindow(time.printTime(), start, myStage);
				time.Reset();
				this.addChild(score);
			}
			
			ohje.addEventListener(MouseEvent.CLICK, start);
		}
		
		private function start(evt:MouseEvent):void
		{
			time = new CountTime();
			timer = new TimerBar(true,0 ,30);
			timer.x = 320;
			timer.y = myStage.stageHeight-40;
			
			this.addChild(timer);
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
			
			this.addChild(exit);
			exit.y = myStage.stageHeight-exit.height;
			
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
				win();
			}
		}
		
		private function win():void
		{
			player.Destruct();
			this.removeChild(player);
			this.removeChild(lab);
			this.removeChild(exit);
			this.removeEventListener(Event.ENTER_FRAME, checkGoal);
			Initialize();
		}
		
		public function Destruct():void
		{
			player.Destruct();
			this.removeChild(player);
		}
	}
}