package screens
{	
	import UIelements.Button;
	import UIelements.GameButton;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import utility.ScreenHandler;
	
	public class Menu extends Sprite
	{
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;

		public var menuGameList:SlideList;

		public var tausta:Bitmap;
		
		public var labyBtn:GameButton = new GameButton("Labyrintti");
		public var metsaBtn:GameButton = new GameButton("Metsastys");
		public var muistiBtn:GameButton = new GameButton("Muistipeli");
		public var yhdistelyBtn:GameButton = new GameButton("Yhdistely");
		public var labyBtn2:GameButton = new GameButton("Labyrintti");
		public var metsaBtn2:GameButton = new GameButton("Metsastys");
		public var muistiBtn2:GameButton = new GameButton("Muistipeli");
		public var labyBtn3:GameButton = new GameButton("Labyrintti");
		public var metsaBtn3:GameButton = new GameButton("Metsastys");
		public var muistiBtn3:GameButton = new GameButton("Muistipeli");
		
		public function Menu(_stage:Stage, scrnHandle:ScreenHandler)
		{
			//constructor, kutsutaan joka kerta kun luokka luodaan voi käyttää samana kun Initialize
			myStage = _stage;
			screenHandler = scrnHandle;
			Initialize();
		}
		
		// voidaan kutsua ulkoapäin nollaamaan/alustamaan kyseinen screen
		public function Initialize():void
		{
			tausta = Assets.getTexture("Tausta");
			tausta.scaleX = 1;
			tausta.scaleY = 1;
			tausta.x = 0;
			tausta.y = 0;
			
			labyBtn.scaleX = 0.4;
			labyBtn.scaleY = 0.4;
			labyBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "labyrintti";
				}
			);
			
			labyBtn2.scaleX = 0.4;
			labyBtn2.scaleY = 0.4;
			labyBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "labyrintti";
				}
			);
			
			labyBtn3.scaleX = 0.4;
			labyBtn3.scaleY = 0.4;
			labyBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "labyrintti";
				}
			);
			
			metsaBtn.scaleX = 0.4;
			metsaBtn.scaleY = 0.4;
			metsaBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "metsa";
				}
			);
			
			metsaBtn2.scaleX = 0.4;
			metsaBtn2.scaleY = 0.4;
			metsaBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "metsa";
				}
			);
			
			metsaBtn3.scaleX = 0.4;
			metsaBtn3.scaleY = 0.4;
			metsaBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "metsa";
				}
			);
			
			muistiBtn.scaleX = 0.4;
			muistiBtn.scaleY = 0.4;
			muistiBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "muistipeli";
				}
			);
			
			muistiBtn2.scaleX = 0.4;
			muistiBtn2.scaleY = 0.4;
			muistiBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "muistipeli";
				}
			);
			
			muistiBtn3.scaleX = 0.4;
			muistiBtn3.scaleY = 0.4;
			muistiBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "muistipeli";
				}
			);
			
			yhdistelyBtn.scaleX = 0.5;
			yhdistelyBtn.scaleY = 0.5;
			yhdistelyBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "yhdistely";
				}
			);
			
			menuGameList = new SlideList(myStage.stageWidth, 200, true);
			menuGameList.x = 0;
			menuGameList.y = myStage.stageHeight/2 - menuGameList.ySize/2;
			menuGameList.addItem(labyBtn);
			menuGameList.addItem(metsaBtn);
			menuGameList.addItem(muistiBtn);
			menuGameList.addItem(yhdistelyBtn);
			menuGameList.addItem(labyBtn2);
			menuGameList.addItem(metsaBtn2);
			menuGameList.addItem(muistiBtn2);
			menuGameList.addItem(labyBtn3);
			menuGameList.addItem(metsaBtn3);
			menuGameList.addItem(muistiBtn3);
			
			Draw();
		}
		
		// kutsutaan ulkoa kun halutaan poistaa screeni
		// poistetaan kaikki luodut lapset ja muu varattu muisti
		public function Destruct():void
		{
			this.removeChild(tausta);
			this.removeChild(labyBtn);
			this.removeChild(labyBtn2);
			this.removeChild(labyBtn3);
			this.removeChild(metsaBtn);
			this.removeChild(metsaBtn2);
			this.removeChild(metsaBtn3);
			this.removeChild(muistiBtn);
			this.removeChild(muistiBtn2);
			this.removeChild(muistiBtn3);
			menuGameList.Destruct();
			this.removeChild(menuGameList);
		}
		
		// käytetään luomaan graafiset elementit
		private function Draw():void
		{
			this.addChild(tausta);
			this.addChild(labyBtn);
			this.addChild(labyBtn2);
			this.addChild(labyBtn3);
			this.addChild(metsaBtn);
			this.addChild(metsaBtn2);
			this.addChild(metsaBtn3);
			this.addChild(muistiBtn);
			this.addChild(muistiBtn2);
			this.addChild(muistiBtn3);
			this.addChild(yhdistelyBtn);
			this.addChild(menuGameList);
		}
	}
}