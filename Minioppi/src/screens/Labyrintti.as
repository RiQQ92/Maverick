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
		//private var bg:Bitmap = Assets.getTexture("Labyrintti_tausta");
		
		public function Labyrintti(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			//bg.x = 0;
			//bg.y = 0;
			//this.addChild(bg);
		
			lab = new Maze(16, 12, myStage, false);
			this.addChild(lab);
			
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