package Minigames
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Muistipeli
	{
		private var bg:Bitmap;
		private var ui:Bitmap;
		
		public function Muistipeli()
		{
			bg = Assets.getTexture("BgKanto");
			ui = Assets.getTexture("UiMuistipeli");
		}
	}
}