package screens
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Yhdistely extends Sprite
	{
		private var bg:Bitmap = Assets.getTexture("Yhdistely_bg");
		
		
		public function Yhdistely()
		{
			super();
			
			this.addChild(bg);
		}
		
		public function Destruct():void
		{
			
		}
	}
}