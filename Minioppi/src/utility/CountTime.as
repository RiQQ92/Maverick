package utility
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class CountTime extends Sprite
	{
		private var countDown:Boolean = false;
		private var pause:Boolean = false;
		
		private var milliseconds:int = 0;
		private var _seconds:int = 0;
		private var _minutes:int = 0;
		private var hours:int = 0;
		
		public function CountTime(_countDown:Boolean = false, countMins:int = 2, countSecs:int = 30)
		{
			countDown = _countDown;
			if(countDown)
			{
				_minutes = countMins;
				_seconds = countSecs;
				milliseconds = 29;
			}
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function get minutes():int
		{
			return _minutes;
		}

		public function get seconds():int
		{
			return _seconds;
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
						_seconds++;
					}
					if(seconds >= 60)
					{
						_seconds = 0;
						_minutes++;
					}
					if(minutes >= 60)
					{
						_minutes = 0;
						hours++;
					}
				}
				else
				{
					milliseconds--;
					
					if(milliseconds < 0)
					{
						milliseconds = 29;
						_seconds--;
					}
					if(seconds < 0)
					{
						_seconds = 59;
						_minutes--;
					}
					if(minutes < 0)
					{
						_minutes = 59;
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
			_seconds = 0;
			_minutes = 0;
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