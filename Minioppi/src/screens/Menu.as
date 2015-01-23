package screens
{	
	import UIelements.Button;
	import UIelements.GameButton;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
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
		public var pilkkiBtn:GameButton = new GameButton("Pilkki");
		public var creditBtn:Button = new Button("TekijatBtn", true);
		
		public function Menu(_stage:Stage, scrnHandle:ScreenHandler)
		{
			//constructor, kutsutaan joka kerta kun luokka luodaan voi käyttää samana kun Initialize
			//Assets.BGMusic = new Sound();
			//Assets.BGMChannel = new SoundChannel();
			//Assets.BGMTransform = new SoundTransform();
			
			Assets.BGMusic = Assets.getSound("Aani_menu");
			Assets.BGMChannel = Assets.BGMusic.play();
			Assets.BGMTransform.volume = 0.5;
			Assets.BGMChannel.soundTransform = Assets.BGMTransform;
			
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
			
			creditBtn.scaleX = 0.5;
			creditBtn.scaleY = 0.5;
			creditBtn.x = 20;
			creditBtn.y = 480-(creditBtn.height*2);
			creditBtn.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "credits";
				}
			);
			
			labyBtn.scaleX = 0.4;
			labyBtn.scaleY = 0.4;
			labyBtn.button.addListener(
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
			
			pilkkiBtn.scaleX = 0.4;
			pilkkiBtn.scaleY = 0.4;
			pilkkiBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "pilkki";
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
			
			yhdistelyBtn.scaleX = 0.4;
			yhdistelyBtn.scaleY = 0.4;
			yhdistelyBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "yhdistely";
				}
			);
			
			menuGameList = new SlideList(myStage.stageWidth, 200, true, this);
			menuGameList.x = 0;
			menuGameList.y = myStage.stageHeight/2 - menuGameList.ySize/2;
			menuGameList.addItem(labyBtn);
			menuGameList.addItem(metsaBtn);
			menuGameList.addItem(muistiBtn);
			menuGameList.addItem(yhdistelyBtn);
			menuGameList.addItem(pilkkiBtn);
			
			Draw();
		}
		
		// kutsutaan ulkoa kun halutaan poistaa screeni
		// poistetaan kaikki luodut lapset ja muu varattu muisti
		public function Destruct():void
		{
			this.removeChild(creditBtn);
			this.removeChild(tausta);
			this.removeChild(labyBtn);
			this.removeChild(metsaBtn);
			this.removeChild(muistiBtn);
			this.removeChild(pilkkiBtn);
			menuGameList.Destruct();
			this.removeChild(menuGameList);
		}
		
		// käytetään luomaan graafiset elementit
		private function Draw():void
		{
			this.addChild(tausta);
			this.addChild(labyBtn);
			this.addChild(metsaBtn);
			this.addChild(muistiBtn);
			this.addChild(pilkkiBtn);
			this.addChild(yhdistelyBtn);
			this.addChild(menuGameList);
			this.addChild(creditBtn);
		}
	}
}