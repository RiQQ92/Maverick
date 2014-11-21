package screens
{
	import UIelements.Button;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import objects.YhdistelyKuvaButton;
	import objects.YhdistelyTekstiButton;
	
	import utility.ScreenHandler;
	
	public class Yhdistely extends Sprite
	{
		private var kuvaLista:SlideList;
		private var tekstiLista:SlideList;
		
		private var textListSelection:String = "";
		private var kuvaListSelection:String = "";
		
		private var kuvaBtnKettu:YhdistelyKuvaButton;
		private var kuvaBtnKarhu:YhdistelyKuvaButton;
		private var kuvaBtnSusi:YhdistelyKuvaButton;
		private var kuvaBtnOrava:YhdistelyKuvaButton;
		private var kuvaBtnLehma:YhdistelyKuvaButton;
		
		private var txtBtnKettu:YhdistelyTekstiButton;
		private var txtBtnKarhu:YhdistelyTekstiButton;
		private var txtBtnSusi:YhdistelyTekstiButton;
		private var txtBtnOrava:YhdistelyTekstiButton;
		private var txtBtnLehma:YhdistelyTekstiButton;
		
		private var bg:Bitmap = Assets.getTexture("Yhdistely_bg");
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		
		public function Yhdistely(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			kuvaBtnKettu = new YhdistelyKuvaButton("Kettu", "", myStage);
			kuvaBtnKarhu = new YhdistelyKuvaButton("Karhu", "", myStage);
			kuvaBtnSusi = new YhdistelyKuvaButton("Susi", "", myStage);
			kuvaBtnOrava = new YhdistelyKuvaButton("Orava", "", myStage);
			kuvaBtnLehma = new YhdistelyKuvaButton("Lehmä", "", myStage);
			
			kuvaBtnKettu.addListener(function(evt:MouseEvent):void
			{
				trace("kettu selected");
				kuvaListSelection = kuvaBtnKettu.ID;
				checkPair();
			});
			kuvaBtnKarhu.addListener(function(evt:MouseEvent):void
			{
				trace("karhu selected");
				kuvaListSelection = kuvaBtnKarhu.ID;
				checkPair();
			});
			kuvaBtnSusi.addListener(function(evt:MouseEvent):void
			{
				trace("susi selected");
				kuvaListSelection = kuvaBtnSusi.ID;
				checkPair();
			});
			kuvaBtnOrava.addListener(function(evt:MouseEvent):void
			{
				trace("orava selected");
				kuvaListSelection = kuvaBtnOrava.ID;
				checkPair();
			});
			kuvaBtnLehma.addListener(function(evt:MouseEvent):void
			{
				trace("lehma selected");
				kuvaListSelection = kuvaBtnLehma.ID;
				checkPair();
			});
			
			txtBtnKettu = new YhdistelyTekstiButton("Ket-tu", "", myStage);
			txtBtnKarhu = new YhdistelyTekstiButton("Kar-hu", "", myStage);
			txtBtnSusi = new YhdistelyTekstiButton("Su-si", "", myStage);
			txtBtnOrava = new YhdistelyTekstiButton("O-ra-va", "", myStage);
			txtBtnLehma = new YhdistelyTekstiButton("Leh-mä", "", myStage);
			
			txtBtnKettu.addListener(function(evt:MouseEvent):void
			{
				trace("kettu selected");
				textListSelection = txtBtnKettu.ID;
				checkPair();
			});
			txtBtnKarhu.addListener(function(evt:MouseEvent):void
			{
				trace("karhu selected");
				textListSelection = txtBtnKarhu.ID;
				checkPair();
			});
			txtBtnSusi.addListener(function(evt:MouseEvent):void
			{
				trace("susi selected");
				textListSelection = txtBtnSusi.ID;
				checkPair();
			});
			txtBtnOrava.addListener(function(evt:MouseEvent):void
			{
				trace("orava selected");
				textListSelection = txtBtnOrava.ID;
				checkPair();
			});
			txtBtnLehma.addListener(function(evt:MouseEvent):void
			{
				trace("lehma selected");
				textListSelection = txtBtnLehma.ID;
				checkPair();
			});
			
			kuvaLista = new SlideList(150, myStage.stageHeight, false, this);
			tekstiLista = new SlideList(150, myStage.stageHeight, false, this);
			
			tekstiLista.x = myStage.stageWidth - tekstiLista.xSize;
			
			this.addChild(bg);
			
			this.addChild(kuvaBtnKettu);
			this.addChild(kuvaBtnKarhu);
			this.addChild(kuvaBtnSusi);
			this.addChild(kuvaBtnOrava);
			this.addChild(kuvaBtnLehma);
			
			this.addChild(txtBtnKettu);
			this.addChild(txtBtnKarhu);
			this.addChild(txtBtnSusi);
			this.addChild(txtBtnOrava);
			this.addChild(txtBtnLehma);
			
			kuvaLista.addItem(kuvaBtnKettu);
			kuvaLista.addItem(kuvaBtnKarhu);
			kuvaLista.addItem(kuvaBtnSusi);
			kuvaLista.addItem(kuvaBtnOrava);
			kuvaLista.addItem(kuvaBtnLehma);
			
			tekstiLista.addItem(txtBtnKettu);
			tekstiLista.addItem(txtBtnKarhu);
			tekstiLista.addItem(txtBtnSusi);
			tekstiLista.addItem(txtBtnOrava);
			tekstiLista.addItem(txtBtnLehma);
			
			this.addChild(kuvaLista);
			this.addChild(tekstiLista);
		}
		
		public function Destruct():void
		{
			
		}
		
		private function checkPair():void
		{
			if(kuvaListSelection == textListSelection)
			{
				removePair();
				kuvaListSelection = "";
				textListSelection = "";
			}
		}
		
		private function removePair():void
		{
			var i:int = 0;
			for(; i < kuvaLista.Length(); i++)
			{
				var kuvaBtn:YhdistelyKuvaButton = kuvaLista.getItemAt(i) as YhdistelyKuvaButton;
				if(kuvaListSelection == kuvaBtn.ID)
					kuvaLista.removeItem(i);
			}
			i = 0;
			for(; i < tekstiLista.Length(); i++)
			{
				var textBtn:YhdistelyTekstiButton = tekstiLista.getItemAt(i) as YhdistelyTekstiButton;
				if(textListSelection == textBtn.ID)
					tekstiLista.removeItem(i);
			}
		}
	}
}