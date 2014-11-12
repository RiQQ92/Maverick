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
		
		private var itemAmount:int;
		private var listPosition:int;
		
		private var menuPrefix:Number;
		private var averageItemSize:Number;
		
		private var forward:Button;
		private var rewind:Button;
		
		private var itemList:Dictionary;
		
		public function SlideList(width:int, height:int, isVertical:Boolean)
		{
			super();
			trace("avautu");
			
			this.xSize = width;
			this.ySize = height;
			
			menuPrefix = 0;
			listPosition = 0;
			itemAmount = 0;
			averageItemSize = 0;
			
			itemList = new Dictionary();
			
			forward = new Button("ArrowRight");
			forward.addEventListener(MouseEvent.CLICK, scrollForward);
			this.addChild(forward);
			
			rewind = new Button("ArrowLeft");
			rewind.addEventListener(MouseEvent.CLICK, scrollBack);
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
		
		protected function update(event:Event):void
		{
			if((averageItemSize * itemAmount) < this.xSize)
			{
				forward.visible = false;
				rewind.visible = false;
			}
			else
			{
				forward.visible = true;
				rewind.visible = true;
			}
			
			for(var i:int; i < itemAmount; i++)
			{
				if(scrollVertical)
				{
					if(itemList[i].x != menuPrefix + ((averageItemSize * i)+averageItemSize/10))
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:menuPrefix * listPosition * i, y:itemList[i].y});
					}
				}
				else
				{
					if(itemList[i].y != menuPrefix + ((averageItemSize * i)+averageItemSize/10))
					{
						com.greensock.TweenLite.to(itemList[i], 0.5, {x:itemList[i].x, y:menuPrefix * listPosition * i});
					}
				}
			}
		}
		
		protected function scrollBack(event:MouseEvent):void
		{
			listPosition--;
			menuPrefix = (listPosition*averageItemSize) + (averageItemSize/10);
		}
		
		protected function scrollForward(event:MouseEvent):void
		{
			listPosition++;
			menuPrefix = (listPosition*averageItemSize) + (averageItemSize/10);
		}
		
		public function addItem(item:*):void
		{
			itemList[itemAmount] = item;
			itemAmount++;
			
			checkPositioning();
		}
		
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
		}
		
		public function removeItem(index:int):void
		{
			if(itemList[index] != null)
			{
				itemList[index] = null;
				itemAmount--;
			}
		}
	}
}