package screens
{
	import UIelements.Button;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import objects.YhdistelyKuvaButton;
	
	import utility.ScreenHandler;
	
	public class Yhdistely extends Sprite
	{
		private var kuvaLista:SlideList;
		private var tekstiLista:SlideList;
		
		private var bg:Bitmap = Assets.getTexture("Yhdistely_bg");
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		
		private var c1:Bitmap = Assets.getTexture("Yhdistely_kana");
		private var c2:Bitmap = Assets.getTexture("Yhdistely_kana");
		private var c3:Bitmap = Assets.getTexture("Yhdistely_kana");
		private var c4:Bitmap = Assets.getTexture("Yhdistely_kana");
		private var c5:Bitmap = Assets.getTexture("Yhdistely_kana");
		private var c6:Bitmap = Assets.getTexture("Yhdistely_kana");
		
		public function Yhdistely(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			myStage = _stage;
			screenHandler = scrnHandle;
			
			kuvaLista = new SlideList(200, myStage.stageHeight, false);
			tekstiLista = new SlideList(200, myStage.stageHeight, false);
			
			tekstiLista.x = myStage.stageWidth - tekstiLista.xSize;
			
			this.addChild(bg);
			this.addChild(c1);
			this.addChild(c2);
			this.addChild(c3);
			this.addChild(c4);
			this.addChild(c5);
			this.addChild(c6);
			kuvaLista.addItem(c1);
			kuvaLista.addItem(c2);
			kuvaLista.addItem(c3);
			tekstiLista.addItem(c4);
			tekstiLista.addItem(c5);
			tekstiLista.addItem(c6);
			this.addChild(kuvaLista);
			this.addChild(tekstiLista);
		}
		
		public function Destruct():void
		{
			
		}
	}
}