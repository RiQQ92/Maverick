package screens
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Muistipeli extends Sprite
	{
		public var bg:Bitmap;
		public var ui:Bitmap;
		
		public var cards:Array;
		
		public function Muistipeli()
		{
			initialize();
		}
		
		private function initialize():void
		{
			bg = Assets.getTexture("BgKanto");
			ui = Assets.getTexture("UiMuistipeli");
			drawScreen();
		}
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(ui);
			
			cards = new Array;
			getCards();
		}
		
		private function getCards():void
		{
			var kanttarelli:Bitmap = Assets.getTexture("LehtiKanttarelli");
			var kanttarelliText:Bitmap = Assets.getTexture("LehtiTekstiKanttarelli");
			cards.push(kanttarelli);
			cards.push(kanttarelliText);
			var karvarousku:Bitmap = Assets.getTexture("LehtiKarvarousku");
			var karvarouskuText:Bitmap = Assets.getTexture("LehtiTekstiKarvarousku");
			cards.push(karvarousku);
			cards.push(karvarouskuText);
			var karpassieni:Bitmap = Assets.getTexture("LehtiPunakarpassieni");
			var karpassieniText:Bitmap = Assets.getTexture("LehtiTekstiPunakarpassieni");
			cards.push(karpassieni);
			cards.push(karpassieniText);
			var valkoKarpassieni:Bitmap = Assets.getTexture("LehtiValkokarpassieni");
			var valkoKarpassieniText:Bitmap = Assets.getTexture("LehtiTekstiValkokarpassieni");
			cards.push(valkoKarpassieni);
			cards.push(valkoKarpassieniText);
			var suppilovahvero:Bitmap = Assets.getTexture("LehtiSuppilovahvero");
			var suppilovahveroText:Bitmap = Assets.getTexture("LehtiTekstiSuppilovahvero");
			cards.push(suppilovahvero);
			cards.push(suppilovahveroText);
			var tatti:Bitmap = Assets.getTexture("LehtiTatti");
			var tattiText:Bitmap = Assets.getTexture("LehtiTekstiTatti");
			cards.push(tatti);
			cards.push(tattiText);
		}
	}
}