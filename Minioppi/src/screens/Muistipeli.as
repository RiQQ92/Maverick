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
			makeSlots();
		}
		
		private function makeSlots():void
		{
			var slot1:Point = new Point(0, 0);
		}
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(ui);
		}
		
		private function getCards():void
		{
			var LehtiKanttarelli:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			/*LehtiKanttarelli.addListener(function(event:MouseEvent):void
				{
					LehtiKanttarelli.flipCard();
				});*/
			LehtiKanttarelli.x = 320;
			LehtiKanttarelli.y = 240;
			this.addChild(LehtiKanttarelli);
			
			var LehtiKanttarelli1:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli1.x = 320;
			LehtiKanttarelli1.y = 240;
			this.addChild(LehtiKanttarelli1);
			
			var LehtiKanttarelli2:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli2.x = 320;
			LehtiKanttarelli2.y = 240;
			this.addChild(LehtiKanttarelli2);
			
			var LehtiKanttarelli3:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli3.x = 320;
			LehtiKanttarelli3.y = 240;
			this.addChild(LehtiKanttarelli3);
			
			var LehtiKanttarelli5:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli5.x = 320;
			LehtiKanttarelli5.y = 240;
			this.addChild(LehtiKanttarelli5);
			
			var LehtiKanttarelli6:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli6.x = 320;
			LehtiKanttarelli6.y = 240;
			this.addChild(LehtiKanttarelli6);
			
			var LehtiKanttarelli7:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli7.x = 320;
			LehtiKanttarelli7.y = 240;
			this.addChild(LehtiKanttarelli7);
			
			var LehtiKanttarelli8:MuistipeliButton = new MuistipeliButton("LehtiKanttarelli");
			LehtiKanttarelli8.x = 320;
			LehtiKanttarelli8.y = 240;
			this.addChild(LehtiKanttarelli8);
		}
		
		public function Destruct():void
		{
			
		}
	}
}