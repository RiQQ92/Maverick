package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class GameButton extends Sprite
	{
		private var board:Bitmap;
		private var button:Bitmap;
		private var chain1:Bitmap;
		private var chain2:Bitmap;
		
		public function GameButton(gameName:String)
		{
			super();
			
			button = Assets.getTexture(gameName+"_nappi");
			chain1 = Assets.getTexture("Ketju");
			chain2 = Assets.getTexture("Ketju");
			board = Assets.getTexture(gameName+"_kuva");
			
			positionItems();
			
			trace(gameName+" "+this.width);
		}
		
		private function positionItems():void
		{
			button.y = 0;
			this.addChild(button);
			
			chain1.y = button.y + button.height;
			this.addChild(chain1);
			
			chain2.y = button.y + button.height;
			this.addChild(chain2);
			
			board.x = 0 ;
			board.y = (chain1.y + chain1.height);
			this.addChild(board);
			
			button.x = (board.x + board.width/2) - button.width/2;
			chain1.x = button.x + chain1.width;
			chain2.x = (button.x + button.width) - chain1.width*2;
		}
	}
}