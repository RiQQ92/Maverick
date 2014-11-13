package screens
{
	import UIelements.Button;
	import UIelements.GameButton;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class Menu extends Sprite
	{
		public var myStage:Stage;
		public var listTest:SlideList;
		
		public var tausta:Bitmap;
		
		public var labyBtn:GameButton = new GameButton("Labyrintti");
		public var metsaBtn:GameButton = new GameButton("Metsastys");
		public var muistiBtn:GameButton = new GameButton("Muistipeli");
		public var labyBtn2:GameButton = new GameButton("Labyrintti");
		public var metsaBtn2:GameButton = new GameButton("Metsastys");
		public var muistiBtn2:GameButton = new GameButton("Muistipeli");
		public var labyBtn3:GameButton = new GameButton("Labyrintti");
		public var metsaBtn3:GameButton = new GameButton("Metsastys");
		public var muistiBtn3:GameButton = new GameButton("Muistipeli");
		
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
			labyBtn.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Labyrintti click'd");
				}
			);
			
			labyBtn2.scaleX = 0.4;
			labyBtn2.scaleY = 0.4;
			labyBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Labyrintti click'd");
				}
			);
			
			labyBtn3.scaleX = 0.4;
			labyBtn3.scaleY = 0.4;
			labyBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Labyrintti click'd");
				}
			);
			
			metsaBtn.scaleX = 0.4;
			metsaBtn.scaleY = 0.4;
			metsaBtn.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Metsapeli click'd");
				}
			);
			
			metsaBtn2.scaleX = 0.4;
			metsaBtn2.scaleY = 0.4;
			metsaBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Metsapeli click'd");
				}
			);
			
			metsaBtn3.scaleX = 0.4;
			metsaBtn3.scaleY = 0.4;
			metsaBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Metsapeli click'd");
				}
			);
			
			muistiBtn.scaleX = 0.4;
			muistiBtn.scaleY = 0.4;
			muistiBtn.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Muistipeli click'd");
				}
			);
			
			muistiBtn2.scaleX = 0.4;
			muistiBtn2.scaleY = 0.4;
			muistiBtn2.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Muistipeli click'd");
				}
			);
			
			muistiBtn3.scaleX = 0.4;
			muistiBtn3.scaleY = 0.4;
			muistiBtn3.button.addListener(
				function(event:MouseEvent):void
				{
					/*
					Tähän kooodi
					mikä siirtää 
					muistipeliin
					*/
					
					trace("Muistipeli click'd");
				}
			);
			
			listTest = new SlideList(myStage.stageWidth, 200, true);
			listTest.x = 0;
			listTest.y = myStage.stageHeight/2 - listTest.ySize/2;
			listTest.addItem(labyBtn);
			listTest.addItem(metsaBtn);
			listTest.addItem(muistiBtn);
			listTest.addItem(labyBtn2);
			listTest.addItem(metsaBtn2);
			listTest.addItem(muistiBtn2);
			listTest.addItem(labyBtn3);
			listTest.addItem(metsaBtn3);
			listTest.addItem(muistiBtn3);
			
			Draw();
		}
		
		protected function metsapeliClicked(event:MouseEvent):void
		{
			/*
			Tähän kooodi
			mikä siirtää 
			muistipeliin
			*/
			
			trace("Metsapeli click'd");
		}
		
		protected function labyrinttipeliClicked(event:MouseEvent):void
		{
			/*
			Tähän kooodi
			mikä siirtää 
			muistipeliin
			*/
			
			trace("Labyrintti click'd");
		}
		
		protected function muistipeliClicked(event:MouseEvent):void
		{
			/*
				Tähän kooodi
				mikä siirtää 
				muistipeliin
			*/
			
			trace("Muistipeli click'd");
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
			this.addChild(labyBtn3);
			this.addChild(metsaBtn);
			this.addChild(metsaBtn2);
			this.addChild(metsaBtn3);
			this.addChild(muistiBtn);
			this.addChild(muistiBtn2);
			this.addChild(muistiBtn3);
			this.addChild(listTest);
		}
	}
}