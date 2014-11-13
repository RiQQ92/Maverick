package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	public class Assets
	{
		// Muistipeli
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Back.png")]
		public static const LehtiBack:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Front.png")]
		public static const LehtiFront:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Bg_Kanto.png")]
		public static const BgKanto:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Muistipeli_UI.png")]
		public static const UiMuistipeli:Class;
		
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
		
		
		// Alkumenu
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
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(textureName:String):Bitmap
		{
			//[Embed(source = "../Grafiikka/Muistipeli/"+ textureName +".png")]
			
			var bitmap:Bitmap = new Assets[textureName]();
			gameTextures[textureName] = bitmap;
				
			return gameTextures[textureName];
		}
	}
}