package screens
{
	import UIelements.Button;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import objects.Maze;
	import objects.Player;
	
	import utility.ScreenHandler;
	
	public class Labyrintti extends Sprite
	{
		private var lab:Maze
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
			
			//lab = new Maze(256, 192, myStage);
			//lab = new Maze(32, 24, myStage);
			lab = new Maze(64, 48, myStage, false);
			this.addChild(lab);
			
			player = new Player(myStage, this);
			player.x = myStage.stageWidth/2;
			player.y = myStage.stageHeight/2;
			player.scaleX = 0.3;
			player.scaleY = 0.3;
			player.addListeners();
			this.addChild(player);
			
			takaisin.x = 0;
			takaisin.y = 0;
			takaisin.scaleX = 0.1;
			takaisin.scaleY = 0.1;
			this.addChild(takaisin);
			takaisin.addListener(function(event:MouseEvent):void
			{
				screenHandler.inScreen = "menu";
			});
		}
		
		public function Destruct():void
		{
			player.Destruct();
			this.removeChild(player);
			this.removeChild(takaisin);
		}
	}
}