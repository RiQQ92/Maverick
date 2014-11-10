package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	public class Utility
	{
		private static var gameTextures:Dictionary = new Dictionary();
		
		public function getTexture(textureName:String)
		{
			[Embed(source = "../media/graphics/"+ textureName +".png")]
			public static const Temp:Class;
			
			var bitmap:Bitmap = new Temp();
			gameTextures[textureName] = bitmap;
		}
		
		public function getTexture(textureName:String, path:String)
		{
			[Embed(source = path + textureName +".png")]
			public static const Temp:Class;
			
			var bitmap:Bitmap = new Temp();
			gameTextures[textureName] = bitmap;
		}
	}
}