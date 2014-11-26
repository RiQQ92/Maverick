package screens
{
	import UIelements.Button;
	import UIelements.ButtonBlocker;
	import UIelements.MuistipeliButton;
	import UIelements.OhjeIkkuna;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import utility.DebugText;
	import utility.ScreenHandler;
	
	public class Muistipeli extends Sprite
	{
		private var myStage:Stage;
		private var screenHandler:ScreenHandler;
		private var blocker:ButtonBlocker = new ButtonBlocker();
		private var pause:Boolean = false;
		private var pauseTimer:int = 0;
		
		public var debug:DebugText;
		
		public var tip:OhjeIkkuna;
		public var bg:Bitmap;
		public var ui:Bitmap;
		
		public var slots:Array = new Array;
		public var cardListKuva:Array = new Array;
		public var cardListText:Array = new Array;
		public var cards:Array = new Array;
		
		public var cardsFound:int = 0;
		
		public var flips:Array = new Array;
		
		public function Muistipeli(_stage:Stage, scrnHandle:ScreenHandler)
		{
			myStage = _stage;			// hyvin käytännöllinen sijoittamaan ja hahmottamaan näytön objektien sijainteja (myStage.stageWidth/2 == kuvan.X keskikohta)
			screenHandler = scrnHandle; // tällä voit vaihtaa screenejä set:ter funktiolla (screenHandler.inScreen = "menu")
			
			initialize();
		}
		
		private function initialize():void
		{
			debug = new DebugText("", myStage);
			tip = new OhjeIkkuna("OhjeMuistipeli");
			bg = Assets.getTexture("BgKanto");
			ui = Assets.getTexture("UiMuistipeli");
			drawScreen();
			this.addChild(tip);
			tip.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		private function startGame(event:MouseEvent):void
		{
			tip.removeEventListener(MouseEvent.CLICK, startGame);
			this.removeChild(tip);
			
			//this.addChild(debug);
			
			makeArrays();
			pickCards();
			setUpCards();
			this.addEventListener(MouseEvent.CLICK, checkFlips);
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			if (pause)
			{
				if (blocker.parent == null)
				{
					this.removeEventListener(MouseEvent.CLICK, checkFlips);
					this.addChild(blocker);
				}
				if (pauseTimer >= 20)
				{
					checkPairs();
					flipBack();
					pauseTimer = 0;
					pause = false;
				} else {
					pauseTimer++;
				}
			}
			else
			{
				if (blocker.parent != null)
				{
					this.addEventListener(MouseEvent.CLICK, checkFlips);
					this.removeChild(blocker);
				}
			}
		}
		
		private function checkFlips(event:MouseEvent):void
		{
			flips = new Array;
			for (var i:int = 0; i<cards.length; i++)
			{
				if (cards[i].backSide == false)
				{
					flips.push(cards[i]);
					cards[i].active = false;
				}
			}
			if (flips.length >= 2)
			{
				pause = true;
			}
		}
		
		private function checkWin(event:Event):void
		{
			if (cardsFound >= 9)
			{
				this.removeEventListener(MouseEvent.CLICK, checkFlips);
				this.removeEventListener(Event.ENTER_FRAME, checkWin);
				screenHandler.inScreen = "menu";
			}
		}
		
		private function flipBack():void
		{
			for (var j:int = 0; j<cards.length; j++)
			{
				if (cards[j].backSide == false)
				{
					cards[j].active = true;
					cards[j].flipCard();
				}
			}
		}
		
		private function checkPairs():void
		{
			var card1:int;
			card1 = getCardNumber(flips[0].imageS);
			var card2:int;
			card2 = getCardNumber(flips[1].imageS);
			
			// jos löytyy parit
			if (card1 == card2)
			{
				cardsFound += 1;
				this.removeChild(flips[0]);
				this.removeChild(flips[1]);
			}
		}
		
		// haetaan nimeä vastaava numero arvo kortille
		private function getCardNumber(name:String):int
		{
			var number:int;
			
			for (var i:int = 0; i<cardListKuva.length; i++)
			{
				if (name == cardListKuva[i])
				{
					number = i;
				}
				if (name == cardListText[i])
				{
					number = i;
				}
			}
			
			return number;
		}
		
		// aseta kortit kentälle satunnaisiin paikkoihin
		private function setUpCards():void
		{
			var arr:Array = new Array();
			var foundNew:Boolean = false;
			var rand:int = 0;
			
			for(var i:int = 0; i<18; i++)
			{
				do {
					foundNew = true;
					rand = Math.ceil(Math.random()*18)-1;
					for(var j:int = 0; j<arr.length; j++)
					{
						if(rand == arr[j])
						{
							foundNew = false;
						}
					}
				} while(!foundNew);
				arr.push(rand);
				this.addChild(cards[i]);
				cards[i].x = slots[rand].x;
				cards[i].y = slots[rand].y;
			}
		}
		
		private function makeArrays():void
		{
			// kohdat mihin kortit sijoitetaan
			var slot1:Point = new Point(27, 57);
			var slot2:Point = new Point(22, 175);
			var slot3:Point = new Point(12, 302);
			var slot4:Point = new Point(138, -2);
			var slot5:Point = new Point(140, 109);
			var slot6:Point = new Point(145, 241);
			var slot7:Point = new Point(138, 354);
			var slot8:Point = new Point(256, 0);
			var slot9:Point = new Point(258, 118);
			var slot10:Point = new Point(262, 241);
			var slot11:Point = new Point(266, 354);
			var slot12:Point = new Point(377, -2);
			var slot13:Point = new Point(380, 109);
			var slot14:Point = new Point(390, 228);
			var slot15:Point = new Point(397, 354);
			var slot16:Point = new Point(502, 43);
			var slot17:Point = new Point(509, 161);
			var slot18:Point = new Point(514, 285);
			slots.push(slot1);
			slots.push(slot2);
			slots.push(slot3);
			slots.push(slot4);
			slots.push(slot5);
			slots.push(slot6);
			slots.push(slot7);
			slots.push(slot8);
			slots.push(slot9);
			slots.push(slot10);
			slots.push(slot11);
			slots.push(slot12);
			slots.push(slot13);
			slots.push(slot14);
			slots.push(slot15);
			slots.push(slot16);
			slots.push(slot17);
			slots.push(slot18);
			
			// Lajilista
			var kanttarelli:String = "LehtiKanttarelli";
			var kanttarelliText:String = "LehtiTekstiKanttarelli";
			cardListKuva.push(kanttarelli);
			cardListText.push(kanttarelliText);
			var karvarousku:String = "LehtiKarvarousku";
			var karvarouskuText:String = "LehtiTekstiKarvarousku";
			cardListKuva.push(karvarousku);
			cardListText.push(karvarouskuText);
			var karpassieni:String = "LehtiPunakarpassieni";
			var karpassieniText:String = "LehtiTekstiPunakarpassieni";
			cardListKuva.push(karpassieni);
			cardListText.push(karpassieniText);
			var suppilovahvero:String = "LehtiSuppilovahvero";
			var suppilovahveroText:String = "LehtiTekstiSuppilovahvero";
			cardListKuva.push(suppilovahvero);
			cardListText.push(suppilovahveroText);
			var tatti:String = "LehtiTatti";
			var tattiText:String = "LehtiTekstiTatti";
			cardListKuva.push(tatti);
			cardListText.push(tattiText);
			var valkokarpassieni:String = "LehtiValkokarpassieni";
			var valkokarpassieniText:String = "LehtiTekstiValkokarpassieni";
			cardListKuva.push(valkokarpassieni);
			cardListText.push(valkokarpassieniText);
			var mansikka:String = "LehtiMansikka";
			var mansikkaText:String = "LehtiTekstiMansikka";
			cardListKuva.push(mansikka);
			cardListText.push(mansikkaText);
			var mustikka:String = "LehtiMustikka";
			var mustikkaText:String = "LehtiTekstiMustikka";
			cardListKuva.push(mustikka);
			cardListText.push(mustikkaText);
			var vadelma:String = "LehtiVadelma";
			var vadelmaText:String = "LehtiTekstiVadelma";
			cardListKuva.push(vadelma);
			cardListText.push(vadelmaText);
			var ampiainen:String = "LehtiAmpiainen";
			var ampiainenText:String = "LehtiTekstiAmpiainen";
			cardListKuva.push(ampiainen);
			cardListText.push(ampiainenText);
		}
		
		private function drawScreen():void
		{
			this.addChild(bg);
			this.addChild(ui);
		}
		
		private function pickCards():void
		{
			var picks:Array = new Array;
			var pick:int;
			var foundNew:Boolean;
			
			// tarkistetaan ettei tule sama kortti kahdesti
			for (var i:int = 0; i<9; i++)
			{
				do {
					foundNew = true;
					pick = Math.ceil(Math.random()*cardListKuva.length)-1;
					for(var j:int = 0; j<picks.length; j++)
					{
						if(pick == picks[j])
						{
							foundNew = false;
						}
					}
				} while(!foundNew);
				picks.push(pick);
			}
			
			// haetaan kortin molemmat parit
			for (var l:int = 0; l<picks.length; l++)
			{
				drawCard(picks[l]);
			}
		}
		
		// luodaan valitut kortit ja annetaan niille toiminto painattaessa
		private function drawCard(pick:int):void
		{
			var cardName:String = cardListKuva[pick];
			var test:MuistipeliButton = new MuistipeliButton(cardName);
			test.addListener(function():void{test.flipCard();});
			cards.push(test);
			cardName = cardListText[pick];
			var test2:MuistipeliButton = new MuistipeliButton(cardName);
			test2.addListener(function():void{test2.flipCard();});
			cards.push(test2);
		}
		
		public function Destruct():void
		{
			
		}
	}
}