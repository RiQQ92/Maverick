package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	public class Assets
	{
		// Muistipeli
		[Embed(source = "../Grafiikka/Muistipeli/LehtiBack.png")]
		public static const LehtiBack:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/LehtiFront.png")]
		public static const LehtiFront:Class;
		
		
		// Alkumenu
		[Embed(source = "../Grafiikka/alkuvalikko/labyrintti_nappi.png")]
		public static const LabyBtn:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/metsastys_nappi.png")]
		public static const MetsaBtn:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/muistipeli_nappi.png")]
		public static const MuistiBtn:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/tausta_kuva.png")]
		public static const Tausta:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(textureName:String):Bitmap
		{
			//[Embed(source = "../Grafiikka/Muistipeli/"+ textureName +".png")]
			
			if(gameTextures[textureName] == undefined)
			{
				var bitmap:Bitmap = new Assets[textureName]();
				gameTextures[textureName] = bitmap;
			}
			
			return gameTextures[textureName];
		}
	}
}