package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.sampler.StackFrame;
	
	import screens.Menu;
	import screens.Muistipeli;
	
	public class ScreenHandler extends Sprite
	{
		public var myStage:Stage;
		public var menu:Menu;
		public var muistipeli:Muistipeli;
		
		private var _inScreen:String;
		
		public function ScreenHandler(_stage:Stage)
		{
			super();
			myStage = _stage;
			menu = new Menu(myStage, this);
			muistipeli = new Muistipeli(myStage, this);
			inScreen = "menu";
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
			// avaa uuden näytön
			var foundMatch:Boolean = true;
			switch(value)
			{
				case "menu":
					
					menu.x = 0;
					menu.y = 0;
					this.addChild(menu);
					
					break;
				case "muistipeli":
					
					muistipeli.x = 0;
					muistipeli.y = 0;
					this.addChild(muistipeli);
					
					break;
				case "labyrintti":
					
					break;
				case "yhdistely":
					
					break;
				default: // suoritetaan kun mikään muu ei täsmää
					foundMatch = false;
					break;
			}
			
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