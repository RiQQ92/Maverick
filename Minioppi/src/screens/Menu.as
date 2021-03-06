package screens
{	
	import UIelements.Button;
	import UIelements.GameButton;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
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
			if(!Assets.cameFromCredits) // ei aloita alusta tausta musiikkia kun käy ja poistuu credits ruudusta
			{
				Assets.BGMChannel.stop();	// pysäyttää vanhan näytön taustamusiikin
				Assets.BGMusic = Assets.getSound("Aani_menu");
				Assets.BGMChannel = Assets.BGMusic.play();
				Assets.setBGMVolume(1); // äänen voimakkuus MIN 0.01 - MAX 1.00
				Assets.BGMChannel.soundTransform = Assets.BGMTransform;
				Assets.BGMChannel.addEventListener(Event.SOUND_COMPLETE, Assets.replayBGM);
			}
			
			Assets.cameFromCredits = false;
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
			
			labyBtn.scaleX = 1;
			labyBtn.scaleY = 1;
			labyBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "labyrintti";
				}
			);
			
			metsaBtn.scaleX = 1;
			metsaBtn.scaleY = 1;
			metsaBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "metsa";
				}
			);
			
			pilkkiBtn.scaleX = 1;
			pilkkiBtn.scaleY = 1;
			pilkkiBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "pilkki";
				}
			);
			
			muistiBtn.scaleX = 1;
			muistiBtn.scaleY = 1;
			muistiBtn.button.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "muistipeli";
				}
			);
			
			yhdistelyBtn.scaleX = 1;
			yhdistelyBtn.scaleY = 1;
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