package screens
{
	import Animaatiot_fla.karhu_animaatio_1;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Metsa extends Sprite
	{
		private var bg:Bitmap = Assets.getTexture("Metsa_bg");
		private var karhu:karhu_animaatio_1 = new karhu_animaatio_1();
		private var bat:Lepakko = new Lepakko();
		private var snail:etanaAnimoitu = new etanaAnimoitu();
		
		public function Metsa()
		{
			super();
			
			this.addChild(bg);
			karhu.x = 370;
			karhu.y = 250;
			this.addChild(karhu);
			snail.x = 320
			snail.y = 240;
			this.addChild(snail);
			bat.x = 320;
			bat.y = 245;
			this.addChild(bat);
		}
		
		public function Destruct():void
		{
			
		}
	}
}