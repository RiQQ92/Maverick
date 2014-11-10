package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	public class Assets
	{
		[Embed(source = "../Grafiikka/Muistipeli/LehtiBack.png")]
		public static const LehtiBack:Class;
		
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