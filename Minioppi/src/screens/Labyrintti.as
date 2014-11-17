package screens
{
	import UIelements.Button;
	
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
		private var bg:Bitmap = Assets.getTexture("Labyrintti_tausta");
		
		public function Labyrintti(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			//lab = new Maze(256, 192, myStage, true);
			//lab = new Maze(32, 24, myStage, true);
			lab = new Maze(32, 24, myStage, false);
			this.addChild(lab);
			
			player = new Player(myStage, this, lab);
			player.x = 0; //myStage.stageWidth/2;
			player.y = 0; //myStage.stageHeight/2;
			player.scaleX = 0.2;
			player.scaleY = 0.2;
			player.addListeners();
			this.addChild(player);
			
			this.addEventListener(Event.ENTER_FRAME, checkGoal);
			/*
			takaisin.x = 0;
			takaisin.y = 0;
			takaisin.scaleX = 0.1;
			takaisin.scaleY = 0.1;
			this.addChild(takaisin);
			takaisin.addListener(function(event:MouseEvent):void
			{
				screenHandler.inScreen = "menu";
			});
			*/
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
			//this.removeChild(takaisin);
		}
		
		/*
		public function asd():void
		{
			var arr:Array = new Array();
			var foundNew:Boolean = false;
			var rand:int = 0;
			for(var i:int = 0; i < 19; i++)
			{
				foundNew = false;
				while(!foundNew)
				{
					rand = Math.ceil(Math.random()*18)-1;
					for(var j:int = 0; j < arr.length; j++)
					{
						if(rand != arr[j])
						{
							foundNew = true;
						}
						else
						{
							foundNew = false;
							break;
						}
					}
				}
				
				arr.push(rand);
			}
		}
		*/
	}
}