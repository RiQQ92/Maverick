package UIelements
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	public class SlideList extends Sprite
	{
		public var hasPhysics:Boolean = false;
		public var scrollVertical:Boolean = true;
		
		public var xSize:int;
		public var ySize:int;
		
		private var isPowerOfTwo:Boolean = false;
		private var isRemoving:Boolean = false;
		
		private var itemAmount:int;
		private var amountOfGaps:int;
		private var listPosition:int;
		
		private var centerX:Number;
		private var centerY:Number;
		private var menuPrefix:Number;
		private var itemListWidth:Number;
		private var itemGap:Number;
		private var averageItemSize:Number;
		
		private var forward:Button;
		private var rewind:Button;
		
		private var listLocations:Vector.<int>;
		private var itemList:Dictionary;
		
		private var parentObj:*;
		
		// alustus/constructor
		public function SlideList(width:int, height:int, isVertical:Boolean, _parent:*)
		{
			super();
			
			parentObj = _parent;
			
			this.xSize = width;
			this.ySize = height;
			this.scrollVertical = isVertical;
			this.centerX = xSize/2;
			this.centerY = ySize/2;
			
			itemListWidth = 0;
			menuPrefix = 0;
			listPosition = 0;
			itemAmount = 0;
			itemGap = 10;
			averageItemSize = 0;
			
			listLocations = new Vector.<int>();
			itemList = new Dictionary();
			
			forward = new Button("ArrowRight");
			forward.addEventListener(MouseEvent.CLICK, scrollBack);
			forward.visible = false;
			this.addChild(forward);
			
			rewind = new Button("ArrowLeft");
			rewind.addEventListener(MouseEvent.CLICK, scrollForward);
			rewind.visible = false;
			this.addChild(rewind);
			
			// sijoittaa nuolen oikeinpäin riippuen onko lista vaaka vai pysty suuntainen
			if(isVertical)
			{
				rewind.x = 0;
				rewind.y = height/2 - forward.height/2;
				forward.x = width - forward.width;
				forward.y = height/2 - forward.height/2;
			}
			else
			{
				rewind.x = width/2 - forward.width/2 + forward.height;
				rewind.y = 0;
				rewind.rotation = 90;
				forward.x = width/2 - forward.width/2 + rewind.height;
				forward.y = height - forward.height;
				forward.rotation = 90;
			}
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		// joka frame päivitys
		private function update(event:Event):void
		{
			for(var i:int; i < itemAmount; i++)
			{
				if(scrollVertical)
				{
					//             x = (listanKoko * kuvanSijaintiLista[i]) + Keskikohta - (kuvanKoko*kuvienMäärä/2) - (VälinKoko*VälienMäärä) + (moneskoKuvaa*(kuvanKoko+Välinkoko));
					if(itemList[i].x != (itemListWidth * listLocations[i]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap)))
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:(itemListWidth * listLocations[i]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap)), y:this.y + this.centerY - itemList[i].height/2});
					}
				}
				else
				{
					if(itemList[i].y != (itemListWidth * listLocations[i]) + menuPrefix + this.centerY - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap)))
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:this.x + this.centerX - itemList[i].width/2, y:(itemListWidth * listLocations[i]) + menuPrefix + this.centerY - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap))});
					}
				}
			}
		}

		// liu'uttaa lsitaa taaksepäin
		private function scrollBack(event:MouseEvent):void
		{
			listPosition--;
			var temp:int = Math.abs(itemAmount-(listPosition%itemAmount))%itemAmount-1;
			
			if(temp == -1)
				temp = itemAmount-1;
			if(temp < 0 || temp > 4)
				temp= temp%itemAmount;
			
			listLocations[temp]++;
			menuPrefix = (listPosition*(itemGap+averageItemSize));
			if(scrollVertical)
				itemList[temp].x = (averageItemSize*2) + (itemListWidth * listLocations[temp]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp-1)*(averageItemSize+itemGap));
			else
				itemList[temp].y = (averageItemSize*2) + (itemListWidth * listLocations[temp]) + menuPrefix + this.centerY - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp-1)*(averageItemSize+itemGap));
		}
		
		// liu'uttaa lsitaa eteenpäin
		private function scrollForward(event:MouseEvent):void
		{
			listPosition++;
			var temp:int = Math.abs(itemAmount-(listPosition%itemAmount));
			
			if(temp == itemAmount)
				temp = 0;
			if(temp < 0 || temp > (itemAmount-1))
				temp= temp%itemAmount;
			
			listLocations[temp]--;
			menuPrefix = (listPosition*(itemGap+averageItemSize));
			if(scrollVertical)
				itemList[temp].x = (itemListWidth * listLocations[temp]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp-1)*(averageItemSize+itemGap));
			else
				itemList[temp].y = (itemListWidth * listLocations[temp]) + menuPrefix + this.centerY - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp-1)*(averageItemSize+itemGap));
		}
		
		// lisää objektin listaan
		public function addItem(item:*):void
		{
			itemList[itemAmount] = item;
			listLocations.push(0);
			itemAmount++;
			if(itemAmount %2 == 0)
				isPowerOfTwo = true;
			else
				isPowerOfTwo = false;
			
			checkPositioning();
		}
		
		// poistaa objektin listasta
		public function removeItem(index:int):void
		{
			if(itemList[index] != null)
			{
				parentObj.removeChild(itemList[index]);
				listLocations.splice(index, 1);
				
				if(itemAmount %2 == 0)
					isPowerOfTwo = true;
				else
					isPowerOfTwo = false;
				
				for(var i:int = index+1; i < itemAmount; i++)
				{
					itemList[i-1] = itemList[i];
				}
				itemAmount--;
				delete itemList[itemAmount];
				
				for(var a:int = 0; a < listLocations.length; a++)
					listLocations[a] = 0;
				
				listPosition = 0;
				menuPrefix = 0;
				
				isRemoving = true;
				
				checkPositioning();
			}
		}
		
		// laskee listan sisällön sijainnin ja koot
		private function checkPositioning():void
		{
			// laskee keskimääräisen listan objektien leveyden/korkeuden
			if(itemAmount >= 3)
			{
				if(scrollVertical)
					averageItemSize = (itemList[0].width + itemList[1].width + itemList[2].width) /3;
				else
					averageItemSize = (itemList[0].height + itemList[1].height + itemList[2].height) /3;
			}
			else
			{
				var items:int = 0;
				if(scrollVertical)
				{
					for(var i:int; i < itemAmount; i++)
					{
						items+= itemList[i].width;
					}
				}
				else
				{
					for(var b:int; b < itemAmount; b++)
					{
						items+= itemList[b].height;
					}
				}
				averageItemSize = items / itemAmount;
			}
			
			// tarkastaa onko lista isompi kuin kuva, jos on niin nuoli napit selaukseen luodaan
			if(scrollVertical)
			{
				if((averageItemSize * itemAmount +((itemAmount * (averageItemSize/10)))-averageItemSize/10) < this.xSize)
				{
					forward.visible = false;
					rewind.visible = false;
				}
				else
				{
					forward.visible = true;
					rewind.visible = true;
				}
			}
			else
			{
				if((averageItemSize * itemAmount +((itemAmount * (averageItemSize/10)))-averageItemSize/10) < this.ySize)
				{
					forward.visible = false;
					rewind.visible = false;
				}
				else
				{
					forward.visible = true;
					rewind.visible = true;
				}
			}
			
			if(!isRemoving)
			{
				// sijoittaa elementit oikeille paikoilleen
				for(var c:int; c < itemAmount; c++)
				{
					if(scrollVertical)
					{
						itemList[c].x = this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (c*(averageItemSize+itemGap));
						itemList[c].y = this.y + this.centerY -itemList[c].height/2;
					}
					else
					{
						itemList[c].x = this.x + this.centerX -itemList[c].width/2;
						itemList[c].y = this.centerY - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (c*(averageItemSize+itemGap));
					}
				}
			}
			
			isRemoving = false;
			itemGap = averageItemSize/10;
			amountOfGaps = itemAmount-1;
			itemListWidth = (averageItemSize*itemAmount + itemAmount*itemGap);
		}
		
		public function getItemAt(index:int):*
		{
			return itemList[index];
		}
		
		public function Length():int
		{
			return itemAmount;
		}
		
		public function Destruct():void
		{
			this.removeEventListener(Event.ENTER_FRAME, update);
			
			for(var i:int; i < itemAmount; i++)
			{
				delete itemList[i];
			}
			
			listLocations.length = 0;
		}
	}
}