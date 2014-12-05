package screens
{
	import UIelements.Button;
	import UIelements.OhjeIkkuna;
	import UIelements.ScoreWindow;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.GraphicsPath;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import objects.YhdistelyKuvaButton;
	import objects.YhdistelyTekstiButton;
	
	import utility.CountTime;
	import utility.ScreenHandler;
	
	public class Yhdistely extends Sprite
	{
		private const PICK_AMOUNT:int = 10;
		
		private var drawLine:Boolean = false;
		private var firstStart:Boolean = true;
		
		private var clickX:int = 100;
		private var clickY:int = 100;
		
		private var line:Shape = new Shape();
		
		private var time:CountTime;
		private var score:ScoreWindow;
		
		private var kuvaLista:SlideList;
		private var tekstiLista:SlideList;
		
		private var textListSelection:YhdistelyTekstiButton;
		private var kuvaListSelection:YhdistelyKuvaButton;
		
		private var bg:Bitmap = Assets.getTexture("Yhdistely_bg");
		private var ohje:OhjeIkkuna = new OhjeIkkuna("OhjeYhdistely");
		private var exit:Button = new Button("TakaisinNappi");
		private var screenHandler:ScreenHandler;
		private var myStage:Stage;
		
		private var animalNames:Array;
		private var imageCards:Array = new Array();
		private var textCards:Array = new Array();
		
		public function Yhdistely(_stage:Stage, scrnHandle:ScreenHandler)
		{
			super();
			
			myStage = _stage;
			screenHandler = scrnHandle;
			
			Initialize();
			myStage.addEventListener(MouseEvent.MOUSE_UP, deactivateDrawing);
		}
		
		protected function deactivateDrawing(event:MouseEvent):void
		{
			drawLine = false;
		}
		
		protected function update(event:Event):void
		{
			if(drawLine)
			{
				line.graphics.clear();
				line.graphics.lineStyle(6, 0x00AA00, 1);
				line.graphics.moveTo(clickX, clickY);
				line.graphics.lineTo(mouseX, mouseY);
			}
			else
			{
				line.graphics.clear();
			}
		}
		
		private function Initialize():void
		{
			this.addChild(bg);
			imageCards = new Array();
			textCards = new Array();
			
			exit.x = myStage.stageWidth/2 -exit.width/2;
			exit.y = myStage.stageHeight -exit.height;
			exit.addListener(
				function(event:MouseEvent):void
				{
					screenHandler.inScreen = "menu";
				}
			);
			this.addChild(exit);
			
			if(firstStart)
			{
				this.addChild(ohje);
				ohje.addEventListener(MouseEvent.CLICK, start);
			}
			else
			{
				score = new ScoreWindow(time.printTime(), start, myStage);
				time.Reset();
				this.addChild(score);
			}
		}
		
		protected function start(event:MouseEvent):void
		{
			time = new CountTime();
			
			if(!firstStart)
			{
				this.removeChild(score);
			}
			else
			{
				ohje.removeEventListener(MouseEvent.CLICK, start);
				this.removeChild(ohje);
			}
			
			firstStart = false;
			
			textListSelection = new YhdistelyTekstiButton("Null", "", myStage);
			textListSelection.visible = false;
			textListSelection.x = myStage.stageWidth/2 + textListSelection.width/50;
			textListSelection.y = myStage.stageHeight/2 - textListSelection.height/2;
			
			kuvaListSelection = new YhdistelyKuvaButton("Null", "", myStage);
			kuvaListSelection.visible = false;
			kuvaListSelection.x = myStage.stageWidth/2 - kuvaListSelection.width - kuvaListSelection.width/10;
			kuvaListSelection.y = myStage.stageHeight/2 - kuvaListSelection.height/2;
			
			initNameArray();
			randomCards();
			allocLists();
			myStage.addEventListener(Event.ENTER_FRAME, update);
			Draw();
		}
		
		private function initNameArray():void
		{
			animalNames = new Array();
			//animalNames.push("Ket-tu");
			//animalNames.push("Kar-hu");
			//animalNames.push("Su-si");
			//animalNames.push("O-ra-va");
			//animalNames.push("Leh-mä");
			//animalNames.push("Koi-ra");
			//animalNames.push("Si-ka");
			//animalNames.push("Ank-ka");
			//animalNames.push("Kuk-ko");
			animalNames.push("Ka-na");
			animalNames.push("Lam-mas");
			animalNames.push("Vuo-hi");
			animalNames.push("Sam-mak-ko");
			animalNames.push("Kil-pi-kon-na");
			animalNames.push("Un-du-laat-ti");
			animalNames.push("Ra-pu");
			animalNames.push("Ki-ma-lai-nen");
			animalNames.push("Jout-sen");
			animalNames.push("E-ta-na");
			animalNames.push("Haa-ra-paeaes-ky");
			animalNames.push("Ha-rak-ka");
			animalNames.push("Hams-te-ri");
			animalNames.push("Met-sae-jae-nis");
			animalNames.push("Per-ho-nen");
			animalNames.push("Peip-po");
			animalNames.push("Sor-sa");
			animalNames.push("Si-si-lis-ko");
		}
		
		private function randomCards():void
		{
			var found:Boolean = false;
			var arr:Array = new Array();
			var random:Number = Math.ceil(Math.random()*animalNames.length)-1;
			
			for(var i:int = 0; i < PICK_AMOUNT; i++)
			{
				do{
					found = true;
					random = Math.ceil(Math.random()*animalNames.length)-1;
					
					for(var b:int = 0; b < arr.length; b++)
					{
						if(random == arr[b])
						{
							found = false;
						}
					}
				}while(!found);
				
				arr.push(random);
				addCard(animalNames[random]);
			}
			
			randomizeCardOrder();
		}
		
		private function addCard(animName:String):void
		{
			var cardImage:YhdistelyKuvaButton = new YhdistelyKuvaButton(animName, animName, myStage);
			cardImage.addListenerOnPress(function(evt:MouseEvent):void
			{
				drawLine = true;
				clickX = mouseX;
				clickY = mouseY;
				
				kuvaListSelection.visible = true;
				kuvaListSelection.setNewContent(cardImage.ID);
				checkPair();
			});
			cardImage.addListenerOnRelease(function(evt:MouseEvent):void
			{
				kuvaListSelection.visible = true;
				kuvaListSelection.setNewContent(cardImage.ID);
				checkPair();
			});
			
			var cardText:YhdistelyTekstiButton = new YhdistelyTekstiButton(animName, animName, myStage);
			cardText.addListenerOnPress(function(evt:MouseEvent):void
			{
				drawLine = true;
				clickX = mouseX;
				clickY = mouseY;
				
				textListSelection.visible = true;
				textListSelection.setNewContent(cardText.ID);
				checkPair();
			});
			cardText.addListenerOnRelease(function(evt:MouseEvent):void
			{
				textListSelection.visible = true;
				textListSelection.setNewContent(cardText.ID);
				checkPair();
			});
			
			imageCards.push(cardImage);                               
			textCards.push(cardText);
		}
		
		private function randomizeCardOrder():void
		{
			var found:Boolean = false;
			var arr:Array = new Array();
			var tempArr:Array = textCards.concat();
			var random:Number = Math.ceil(Math.random()*tempArr.length)-1;
			
			for(var i:int = 0; i < tempArr.length; i++)
			{
				do{
					found = true;
					random = Math.ceil(Math.random()*tempArr.length)-1;
					
					for(var b:int = 0; b < arr.length; b++)
					{
						if(random == arr[b])
						{
							found = false;
						}
					}
				}while(!found);
				
				arr.push(random);
				textCards[i] = tempArr[random];
			}
		}
		
		private function allocLists():void
		{
			kuvaLista = new SlideList(130, myStage.stageHeight, false, this);
			tekstiLista = new SlideList(130, myStage.stageHeight, false, this);
			
			tekstiLista.x = myStage.stageWidth - tekstiLista.xSize;
			
			for(var i:int = 0; i < PICK_AMOUNT; i++)
			{
				kuvaLista.addItem(imageCards[i]);
				tekstiLista.addItem(textCards[i]);
			}
		}
		
		private function checkPair():void
		{
			if(kuvaListSelection.ID == textListSelection.ID)
			{
				removePair();
			}
		}
		
		private function removePair():void
		{
			var i:int = 0;
			for(; i < kuvaLista.Length(); i++)
			{
				var kuvaBtn:YhdistelyKuvaButton = kuvaLista.getItemAt(i) as YhdistelyKuvaButton;
				if(kuvaListSelection.ID == kuvaBtn.ID)
					kuvaLista.removeItem(i);
			}
			i = 0;
			for(; i < tekstiLista.Length(); i++)
			{
				var textBtn:YhdistelyTekstiButton = tekstiLista.getItemAt(i) as YhdistelyTekstiButton;
				if(textListSelection.ID == textBtn.ID)
					tekstiLista.removeItem(i);
			}
			
			kuvaListSelection.visible = false;
			textListSelection.visible = false;
			checkListSizes();
		}
		
		private function checkListSizes():void
		{
			if(tekstiLista.Length() == 0 && kuvaLista.Length() == 0)
			{
				win();
			}
		}
		
		private function win():void
		{
			//screenHandler.inScreen = "menu";
			Destruct();
			Initialize();
		}
		
		public function Destruct():void
		{
			this.removeChild(bg);
			this.removeChild(exit);
			this.removeChild(kuvaListSelection);
			this.removeChild(textListSelection);
			
			animalNames = new Array();
			imageCards = new Array();
			textCards = new Array();
			
			tekstiLista.Destruct();
			this.removeChild(tekstiLista);
			kuvaLista.Destruct();
			this.removeChild(kuvaLista);
		}
		
		private function Draw():void
		{
			this.addChild(kuvaListSelection);
			this.addChild(textListSelection);
			
			for(var i:int = 0; i < PICK_AMOUNT; i++)
			{
				this.addChild(imageCards[i]);
				this.addChild(textCards[i]);
			}
			
			this.addChild(kuvaLista);
			this.addChild(tekstiLista);
			this.addChild(line);
		}
	}
}