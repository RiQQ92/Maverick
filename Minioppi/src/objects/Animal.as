package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Animal extends Sprite
	{
		private var image:Bitmap;
		
		public var hitbox:Bitmap = Assets.getTexture("HitBox");
		
		public var isGood:Boolean;
		
		public function Animal(_isGood:Boolean)
		{
			super();
			isGood = _isGood;
			
			if(!isGood)
				image = randomBad();
			else
				image = randomGood();
			
			this.addChild(hitbox);
			this.addChild(image);
			hitbox.visible = false;
			hitbox.x = image.width/2 -hitbox.width/2;
			hitbox.y = image.height/2 -hitbox.height/2;
		}
		
		// arpoo vaarattoman eläimen kuvan
		private function randomGood():Bitmap
		{
			var bmap:Bitmap;
			var random:Number = Math.random();
			
			if(random < 0.33)
				bmap = Assets.getTexture("Labyrintti_orava");
			else if(random > 0.66)
				bmap = Assets.getTexture("Labyrintti_janis");
			else
				bmap = Assets.getTexture("Labyrintti_kettu");
			
			return bmap;
		}
		
		// arpoo vaarallisen eläimen kuvan
		private function randomBad():Bitmap
		{
			var bmap:Bitmap;
			var random:Number = Math.random();
			
			if(random < 0.33)
				bmap = Assets.getTexture("Labyrintti_karhu");
			else if(random > 0.66)
				bmap = Assets.getTexture("Labyrintti_ilves");
			else
				bmap = Assets.getTexture("Labyrintti_hirvi");
			
			return bmap;
		}
	}
}