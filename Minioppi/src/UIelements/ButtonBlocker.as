package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class ButtonBlocker extends Sprite
	{
		private var block:Bitmap;
		
		public function ButtonBlocker()
		{
			block = Assets.getTexture("Button_Blocker");
			this.addChild(block);
		}
	}
}