package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Animal extends Sprite
	{
		private var image:Bitmap;
		
		public var isGood:Boolean;
		
		public function Animal(_isGood:Boolean)
		{
			super();
			isGood = _isGood;
			
			if(!isGood)
				image = Assets.getTexture("Labyrintti_karhu");
			else
				image = Assets.getTexture("Labyrintti_janis");
			
			this.addChild(image);
		}
	}
}