package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.sampler.StackFrame;
	
	import screens.Labyrintti;
	import screens.Menu;
	import screens.Metsa;
	import screens.Muistipeli;
	
	public class ScreenHandler extends Sprite
	{
		public var myStage:Stage;
		private var menu:Menu;
		private var muistipeli:Muistipeli;
		private var laby:Labyrintti;
		private var metsa:Metsa;
		
		private var _inScreen:String = "Empty";
		
		public function ScreenHandler(_stage:Stage)
		{
			super();
			myStage = _stage;
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
			if(value != _inScreen)
			{
				// avaa uuden näytön, jos ei yritetä avata samaa uudestaan
				switch(value)
				{
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
						
						metsa = new Metsa();
						metsa.x = 0;
						metsa.y = 0;
						this.addChild(metsa);
						
						break;
					case "yhdistely":
							
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
					case "yhdistely":
						
						break;
					default: // suoritetaan kun mikään muu ei täsmää
						
						break;
				}
			
				_inScreen = value;
			}
		}
	}
}