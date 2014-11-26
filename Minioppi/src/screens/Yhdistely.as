package screens
{
	import UIelements.Button;
	import UIelements.SlideList;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import objects.YhdistelyKuvaButton;
	import objects.YhdistelyTekstiButton;
	
	import utility.ScreenHandler;
	
	public class Yhdistely extends Sprite
	{
		private const PICK_AMOUNT:int = 10;
		
		private var kuvaLista:SlideList;
		private var tekstiLista:SlideList;
		
		private var textListSelection:YhdistelyTekstiButton;
		private var kuvaListSelection:YhdistelyKuvaButton;
		
		private var bg:Bitmap = Assets.getTexture("Yhdistely_bg");
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
			cardImage.addListener(function(evt:MouseEvent):void
			{
				kuvaListSelection.visible = true;
				kuvaListSelection.setNewContent(cardImage.ID);
				checkPair();
			});
			
			var cardText:YhdistelyTekstiButton = new YhdistelyTekstiButton(animName, animName, myStage);
			cardText.addListener(function(evt:MouseEvent):void
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
		
		public function Destruct():void
		{
			
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
			screenHandler.inScreen = "menu";
		}
		
		private function Draw():void
		{
			this.addChild(bg);
			this.addChild(kuvaListSelection);
			this.addChild(textListSelection);
			
			for(var i:int = 0; i < PICK_AMOUNT; i++)
			{
				this.addChild(imageCards[i]);
				this.addChild(textCards[i]);
			}
			
			this.addChild(kuvaLista);
			this.addChild(tekstiLista);
		}
	}
}