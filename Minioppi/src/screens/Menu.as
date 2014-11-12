package screens
{
	import UIelements.Button;
	import UIelements.GameButton;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class Menu extends Sprite
	{
		public var myStage:Stage;
		public var listTest:SlideList;
		
		public var tausta:Bitmap;
		
		public var labyBtn:GameButton = new GameButton("Labyrintti");
		public var labyBtn2:GameButton = new GameButton("Labyrintti");
		public var metsaBtn:GameButton = new GameButton("Metsastys");
		public var metsaBtn2:GameButton = new GameButton("Metsastys");
		public var muistiBtn:GameButton = new GameButton("Muistipeli");
		
		public function Menu(_stage:Stage)
		{
			//constructor, kutsutaan joka kerta kun luokka luodaan voi käyttää samana kun Initialize
			myStage = _stage;
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
			labyBtn2.scaleX = 0.4;
			labyBtn2.scaleY = 0.4;
			metsaBtn.scaleX = 0.4;
			metsaBtn.scaleY = 0.4;
			metsaBtn2.scaleX = 0.4;
			metsaBtn2.scaleY = 0.4;
			muistiBtn.scaleX = 0.4;
			muistiBtn.scaleY = 0.4;
			
			listTest = new SlideList(myStage.stageWidth, 200, true);
			listTest.x = 0;
			listTest.y = myStage.stageWidth/2 - listTest.ySize/2;
			
			listTest.addItem(labyBtn);
			listTest.addItem(metsaBtn);
			listTest.addItem(muistiBtn);
			listTest.addItem(labyBtn2);
			listTest.addItem(metsaBtn2);
			
			Draw();
		}
		
		// kutsutaan ulkoa kun halutaan poistaa screeni
		// poistetaan kaikki luodut lapset ja muu varattu muisti
		public function Destruct():void
		{
			this.removeChild(tausta);
			this.removeChild(listTest);
		}
		
		// käytetään luomaan graafiset elementit
		private function Draw():void
		{
			this.addChild(tausta);
			this.addChild(labyBtn);
			this.addChild(labyBtn2);
			this.addChild(metsaBtn);
			this.addChild(metsaBtn2);
			this.addChild(muistiBtn);
			this.addChild(listTest);
		}
	}
}