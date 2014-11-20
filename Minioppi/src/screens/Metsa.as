package screens
{
	import Animaatiot_fla.karhu_animaatio_1;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Metsa extends Sprite
	{
		private var bg:Bitmap = Assets.getTexture("Metsa_bg");
		private var karhu:karhu_animaatio_1 = new karhu_animaatio_1();
		
		public function Metsa()
		{
			super();
			
			this.addChild(bg);
			karhu.x = 370;
			karhu.y = 250;
			this.addChild(karhu);
		}
		
		public function Destruct():void
		{
			
		}
	}
}