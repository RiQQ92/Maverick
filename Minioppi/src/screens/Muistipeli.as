package screens
{
	import UIelements.Button;
	import UIelements.MuistipeliButton;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import utility.ScreenHandler;
	
	public class Muistipeli extends Sprite
	{
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		
		public var bg:Bitmap;
		public var ui:Bitmap;
		
		public var slots:Array;
		public var cards:Array;
		
		public function Muistipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;			// hyvin käytännöllinen sijoittamaan ja hahmottamaan näytön objektien sijainteja (myStage.stageWidth/2 == kuvan.X keskikohta)
			screenHandler = scrnHandle; // tällä voit vaihtaa screenejä set:ter funktiolla (screenHandler.inScreen = "menu")
			
			initialize();
		}
		
		private function initialize():void
		{
			bg = Assets.getTexture("BgKanto");
			ui = Assets.getTexture("UiMuistipeli");
			drawScreen();
		}
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(ui);
			
			cards = new Array;
			getCards();
		}
		
		private function getCards():void
		{
			var kanttarelli:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			kanttarelli.addListener(
				function(event:MouseEvent):void
				{
					kanttarelli.flipCard();
				}
			);
			kanttarelli.x = 320;
			kanttarelli.y = 240;
			this.addChild(kanttarelli);
		}
		
		public function Destruct():void
		{
			
		}
	}
}