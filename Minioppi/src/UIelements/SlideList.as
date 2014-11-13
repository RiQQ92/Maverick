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
		
		// alustus/constructor
		public function SlideList(width:int, height:int, isVertical:Boolean)
		{
			super();
			
			this.xSize = width;
			this.ySize = height;
			this.centerX = this.x + width/2;
			this.centerY = this.y + height/2;
			
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
		protected function update(event:Event):void
		{
			for(var i:int; i < itemAmount; i++)
			{
				if(scrollVertical)
				{
					//                x = Keskikohta - (kuvanKoko*kuvienMäärä/2) - (VälinKoko*VälienMäärä) + (moneskoKuvaa*(kuvanKoko+Välinkoko));
					if(itemList[i].x != (itemListWidth * listLocations[i]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap)))
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:(itemListWidth * listLocations[i]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (i*(averageItemSize+itemGap)), y:itemList[i].y});
					}
				}
				else
				{
					if(itemList[i].y != menuPrefix + this.centerX - (((itemAmount/2)* averageItemSize) + (averageItemSize/10/2))*i- averageItemSize/10/2)
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:itemList[i].x, y:this.centerY - (((itemAmount/2)* averageItemSize) + (averageItemSize/10/2))*i- averageItemSize/10/2});
					}
				}
			}
		}

		// liu'uttaa lsitaa taaksepäin
		protected function scrollBack(event:MouseEvent):void
		{
			listPosition--;
			var temp:int = Math.abs(itemAmount-(listPosition%itemAmount))%itemAmount-1;
			
			//trace("temp at first "+temp);
			if(temp == -1)
				temp = 4;
			if(temp < 0 || temp > 4)
				temp= temp%5;
			//trace(listPosition + "  " + itemAmount);
			//trace(temp);
			listLocations[temp]++;
			menuPrefix = (listPosition*(itemGap+averageItemSize));
			itemList[temp].x = (itemListWidth * listLocations[temp]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp+1)*(averageItemSize+itemGap));
			//trace("scroll back. List position: "+ listPosition + " _menu prefix: "+ menuPrefix);
		}
		// liu'uttaa lsitaa eteenpäin
		protected function scrollForward(event:MouseEvent):void
		{
			listPosition++;
			var temp:int = Math.abs(itemAmount-(listPosition%itemAmount));
			//trace("temp at first "+temp);
			if(temp == 5)
				temp = 0;
			if(temp < 0 || temp > 4)
				temp= temp%5;
			//trace(listPosition + "  " + itemAmount);
			//trace(temp);
			listLocations[temp]--;
			menuPrefix = (listPosition*(itemGap+averageItemSize));
			itemList[temp].x = (itemListWidth * listLocations[temp]) + menuPrefix + this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + ((temp-1)*(averageItemSize+itemGap));
			//trace("scroll forward. List position: "+ listPosition + " _menu prefix: "+ menuPrefix);
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
				itemList[index] = null;
				listLocations.splice(index, 1);
				itemAmount--;
				if(itemAmount %2 == 0)
					isPowerOfTwo = true;
				else
					isPowerOfTwo = false;
				
				checkPositioning();
			}
		}
		
		// laskee listan sisällön sijainnin ja koot
		private function checkPositioning():void
		{
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
			
			if(isPowerOfTwo)
			{
				for(var c:int; c < itemAmount; c++)
				{
					itemList[c].x = this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (c*(averageItemSize+itemGap));
					itemList[c].y = this.centerY;
				}
			}
			else
			{
				for(var d:int; d < itemAmount; d++)
				{
					itemList[d].x = this.centerX - (averageItemSize*itemAmount/2) - (itemGap*(amountOfGaps/2)) + (d*(averageItemSize+itemGap));
					itemList[d].y = this.centerY;
				}
			}
			
			itemGap = averageItemSize/10;
			amountOfGaps = itemAmount-1;
			itemListWidth = (averageItemSize*itemAmount + itemAmount*itemGap);
		}
	}
}