package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	public class Assets
	{
		// Muistipeli
		//*********************
		[Embed(source = "../Grafiikka/Muistipeli/Muistipeli_UI.png")]
		public static const UiMuistipeli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Bg_Kanto.png")]
		public static const BgKanto:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Back.png")]
		public static const LehtiBack:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Front.png")]
		public static const LehtiFront:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Kanttarelli.png")]
		public static const LehtiKanttarelli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Karvarousku.png")]
		public static const LehtiKarvarousku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Punakärpässieni.png")]
		public static const LehtiPunakarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Suppilovahvero.png")]
		public static const LehtiSuppilovahvero:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Tatti.png")]
		public static const LehtiTatti:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Valkokärpässieni.png")]
		public static const LehtiValkokarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Kanttarelli.png")]
		public static const LehtiTekstiKanttarelli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Karvarousku.png")]
		public static const LehtiTekstiKarvarousku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Kärpässieni.png")]
		public static const LehtiTekstiPunakarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Suppilovahvero.png")]
		public static const LehtiTekstiSuppilovahvero:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Tatti.png")]
		public static const LehtiTekstiTatti:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Valkokärpässieni.png")]
		public static const LehtiTekstiValkokarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Mansikka.png")]
		public static const LehtiMansikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Mansikka.png")]
		public static const LehtiTekstiMansikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Vadelma.png")]
		public static const LehtiVadelma:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Vadelma.png")]
		public static const LehtiTekstiVadelma:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Mustikka.png")]
		public static const LehtiMustikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Mustikka.png")]
		public static const LehtiTekstiMustikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Ampiainen.png")]
		public static const LehtiAmpiainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Ampiainen.png")]
		public static const LehtiTekstiAmpiainen:Class;
		//*********************
		
		// Alkumenu
		//********************
		[Embed(source = "../Grafiikka/alkuvalikko/napit/labyrintti_nappi.png")]
		public static const Labyrintti_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/labyrintti_kuva.png")]
		public static const Labyrintti_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/metsastys_nappi.png")]
		public static const Metsastys_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/metsastys_kuva.png")]
		public static const Metsastys_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/muistipeli_nappi.png")]
		public static const Muistipeli_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/muistipeli_kuva.png")]
		public static const Muistipeli_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/ketju.png")]
		public static const Ketju:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/tausta_kuva.png")]
		public static const Tausta:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/nuoli_vasemmalle.png")]
		public static const ArrowLeft:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/nuoli_oikealle.png")]
		public static const ArrowRight:Class;
		//********************
		
		// Labyrintti
		//********************
		[Embed(source = "../Grafiikka/Labyrintti/lab_wall.png")]
		public static const Labyrintti_seina:Class;
		[Embed(source = "../Grafiikka/Labyrintti/lab_road.png")]
		public static const Labyrintti_tie:Class;
		[Embed(source = "../Grafiikka/Labyrintti/lab_finish.png")]
		public static const Labyrintti_maali:Class;
		[Embed(source = "../Grafiikka/Labyrintti/lab_player.png")]
		public static const Labyrintti_pelaaja:Class;
		[Embed(source = "../Grafiikka/Labyrintti/tausta.png")]
		public static const Labyrintti_tausta:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/Hirvi_kasvokuva.png")]
		public static const Labyrintti_hirvi:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Janis_kasvokuva.png")]
		public static const Labyrintti_janis:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Kettu_kasvokuva.png")]
		public static const Labyrintti_kettu:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Karhu_kasvokuva.png")]
		public static const Labyrintti_karhu:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Ilves_kasvokuva.png")]
		public static const Labyrintti_ilves:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Orava_kasvokuva.png")]
		public static const Labyrintti_orava:Class;
		//********************
		
		// Muu
		//********************
		[Embed(source = "../Grafiikka/Muu/VCAM_zone.png")]
		public static const VCAM_zone:Class;
		//********************
		
		// Aanet
		//********************
		//[Embed(source = "../Aanet/Yhdistely/koira.mp3")]
		//public static const Aani_yhdistely_koira:Class;
		//********************
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(textureName:String):Bitmap
		{
			//[Embed(source = "../Grafiikka/Muistipeli/"+ textureName +".png")]
			
			var bitmap:Bitmap = new Assets[textureName]();
			gameTextures[textureName] = bitmap;
				
			return gameTextures[textureName];
		}
		
		public static function getSound(soundName:String):Sound
		{
			var sound:Sound = new Assets[soundName]();
			
			return sound;
		}
	}
}