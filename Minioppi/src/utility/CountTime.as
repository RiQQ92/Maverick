package utility
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CountTime extends Sprite
	{
		private var countDown:Boolean = false;
		private var pause:Boolean = false;
		
		private var milliseconds:int = 0;
		private var seconds:int = 0;
		private var minutes:int = 0;
		private var hours:int = 0;
		
		public function CountTime(_countDown:Boolean = false, countMins:int = 2, countSecs:int = 30)
		{
			trace(countMins);
			
			countDown = _countDown;
			if(countDown)
			{
				minutes = countMins;
				seconds = countSecs;
				milliseconds = 0;
			}
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			if(!pause)
			{
				if(!countDown)
				{
					milliseconds++;
					
					if(milliseconds >= 30)
					{
						milliseconds = 0;
						seconds++;
					}
					if(seconds >= 60)
					{
						seconds = 0;
						minutes++;
					}
					if(minutes >= 60)
					{
						minutes = 0;
						hours++;
					}
				}
				else
				{
					milliseconds--;
					
					if(milliseconds < 0)
					{
						milliseconds = 29;
						seconds--;
					}
					if(seconds < 0)
					{
						seconds = 59;
						minutes--;
					}
					if(minutes < 0)
					{
						minutes = 59;
						hours--;
					}
				}
			}
		}
		
		public function Stop():void
		{
			pause = true;
		}
		
		public function Continue():void
		{
			pause = false;
		}
		
		public function Reset():void
		{
			milliseconds = 0;
			seconds = 0;
			minutes = 0;
			hours = 0;
		}
		
		public function printTime():String
		{
			var str:String = "";
			var mills:int = (milliseconds * 1000)/ 30;

			if(hours > 0)
				{str += hours.toString()+":";}
			
			if(minutes == 0)
				{str += "00:";}
			else if(minutes < 10)
				{str += "0"+minutes.toString()+":";}
			else
				{str += minutes.toString()+":";}
			
			if(seconds < 10)
				{str += "0";}
			
			str += seconds.toString()+"."+mills.toString();
			
			return str;
		}
	}
}