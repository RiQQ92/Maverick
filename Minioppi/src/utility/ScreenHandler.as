package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.sampler.StackFrame;
	
	import screens.Labyrintti;
	import screens.Menu;
	import screens.Metsa;
	import screens.Muistipeli;
	import screens.Pilkkipeli;
	import screens.Yhdistely;
	import screens.CreditScreen;
	
	public class ScreenHandler extends Sprite
	{
		public var myStage:Stage;
		private var menu:Menu;
		private var muistipeli:Muistipeli;
		private var laby:Labyrintti;
		private var metsa:Metsa;
		private var yhdistely:Yhdistely;
		private var pilkki:Pilkkipeli;
		private var credits:CreditScreen;
		
		private var _inScreen:String = "Empty";
		
		public function ScreenHandler(_stage:Stage)
		{
			super();
			myStage = _stage;
			Assets.gameStage = myStage;
		}
		
		/*
			get:terin ja set:terin käyttö:
		
			kun halutaan tieto get:terista
			myInfo = getterFunktio; // ei siis sulkeita perään kuin tavallisessa funktiossa
		
			kun laitetaan tietoa set:teriin
			setterFunktio = myInfo;
		*/
		public function get inScreen():String
		{
			return _inScreen;
		}
		
		public function set inScreen(value:String):void
		{
			var foundMatch:Boolean = true;
			if(value != _inScreen) // avaa uuden näytön, jos ei yritetä avata samaa uudestaan
			{
				switch(value)
				{
					case "credits":
						
						credits = new CreditScreen(myStage, this);
						credits.x = 0;
						credits.y = 0;
						this.addChild(credits);
						
						break;
					case "menu":
					
						menu = new Menu(myStage, this);
						menu.x = 0;
						menu.y = 0;
						this.addChild(menu);
							
						break;
					case "muistipeli":
						
						muistipeli = new Muistipeli(myStage, this);
						muistipeli.x = 0;
						muistipeli.y = 0;
						this.addChild(muistipeli);
						
						break;
					case "labyrintti":
						
						laby = new Labyrintti(myStage, this);
						laby.x = 0;
						laby.y = 0;
						this.addChild(laby);
						
						break;
					case "metsa":
						
						metsa = new Metsa(myStage, this);
						metsa.x = 0;
						metsa.y = 0;
						this.addChild(metsa);
						
						break;
					case "pilkki":
						
						pilkki = new Pilkkipeli(myStage, this);
						pilkki.x = 0;
						pilkki.y = 0;
						this.addChild(pilkki);
						
						break;
					case "yhdistely":
							
						yhdistely = new Yhdistely(myStage, this);
						yhdistely.x = 0;
						yhdistely.y = 0;
						this.addChild(yhdistely);
						
						break;
					default: // suoritetaan kun mikään muu ei täsmää
						foundMatch = false;
						break;
				}
			}
			else
				foundMatch = false;
			
			if(foundMatch)
			{
				// poistaa vanhan näytön, jos kutsuttu näyttö löytyi
				switch(_inScreen)
				{
					case "credits":
						
						credits.Destruct();
						this.removeChild(credits);
						
						break;
					case "menu":
						
						menu.Destruct();
						this.removeChild(menu);
						
						break;
					case "muistipeli":
						
						muistipeli.Destruct();
						this.removeChild(muistipeli);
						
						break;
					case "labyrintti":
						
						laby.Destruct();
						this.removeChild(laby);
						
						break;
					
					case "metsa":
						
						metsa.Destruct();
						this.removeChild(metsa);
						
						break;
					case "pilkki":
						
						pilkki.Destruct();
						this.removeChild(pilkki);
						
						break;
					
					case "yhdistely":
						
						yhdistely.Destruct();
						this.removeChild(yhdistely);
						
						break;
					default: // suoritetaan kun mikään muu ei täsmää
						
						break;
				}
				
				_inScreen = value;			// asettaa muistiin uuden näytön nimen
			}
		}
	}
}