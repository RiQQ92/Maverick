package utility
{
	public class Time
	{
		private var _hours:int = 0;
		private var _minutes:int = 0;
		private var _seconds:int = 0;
		private var _milliseconds:int = 0;
		
		private var time:String = "";
		
		public function Time(hours:int = 99, minutes:int = 59, seconds:int = 59, milliseconds:int = 999)
		{
			_hours = hours;
			_minutes = minutes;
			_seconds = seconds;
			_milliseconds = milliseconds;
			
			correctTime();
			compileTime();
		}
		
		public function setTime(hours:int, minutes:int, seconds:int, milliseconds:int):void
		{
			_hours = hours;
			_minutes = minutes;
			_seconds = seconds;
			_milliseconds = milliseconds;
			
			correctTime();
			compileTime();
		}
		
		public function getTimeString():String
		{
			return time;
		}
		
		public function get hours():int
		{
			return _hours;
		}

		public function set hours(value:int):void
		{
			_hours = value;
			correctTime();
			compileTime();
		}

		public function get minutes():int
		{
			return _minutes;
		}

		public function set minutes(value:int):void
		{
			_minutes = value;
			correctTime();
			compileTime();
		}

		public function get seconds():int
		{
			return _seconds;
		}

		public function set seconds(value:int):void
		{
			_seconds = value;
			correctTime();
			compileTime();
		}

		public function get milliseconds():int
		{
			return _milliseconds;
		}

		public function set milliseconds(value:int):void
		{
			_milliseconds = value;
			correctTime();
			compileTime();
		}
		
		// returns true if this is lower value
		public function compareTimes(comparor:Time):Boolean
		{
			var thisLower:Boolean = false;
			var majorDifference:Boolean = false;
			
			if(this._hours < comparor._hours)
			{
				majorDifference = true;
				thisLower = true;
			}
			else if(this._hours > comparor._hours)
			{
				majorDifference = true;
				thisLower = false;
			}
			
			
			if(!majorDifference && this._minutes < comparor._minutes)
			{
				majorDifference = true;
				thisLower = true;
			}
			else if(!majorDifference && this._minutes > comparor._minutes)
			{
				majorDifference = true;
				thisLower = false;
			}
			
			
			if(!majorDifference && this._seconds < comparor._seconds)
			{
				majorDifference = true;
				thisLower = true;
			}
			else if(!majorDifference && this._seconds > comparor._seconds)
			{
				majorDifference = true;
				thisLower = false;
			}
			
			
			if(!majorDifference && this._milliseconds < comparor._milliseconds)
				thisLower = true;
			else if(!majorDifference && this._milliseconds > comparor._milliseconds)
				thisLower = false;
			
			return thisLower;
		}
		
		private function correctTime():void
		{
			var didChanges:Boolean = false;
			
			if(_minutes > 60)
			{
				_minutes -= 60;
				_hours++;
				didChanges = true;
			}
			
			if(_seconds > 60)
			{
				_seconds -= 60;
				_minutes++;
				didChanges = true;
			}
			
			if(_milliseconds > 1000)
			{
				_milliseconds -= 1000;
				_seconds++;
				didChanges = true;
			}
			
			if(didChanges)
				correctTime();
		}

		private function compileTime():void
		{
			if(_hours > 0)
			{
				if(_hours < 10 && _hours != 0)
					time = "0";
				else
					time = "";
				
				time += _hours.toString()+":";
			}
			else
				time = "";
			
			if(minutes > 0)
			{
				if(_minutes < 10)
					time += "0";
			
				time += _minutes.toString()+":";
			}
			if(_seconds < 10)
				time += "0";
			
			time += _seconds.toString()+".";
			
			if(_milliseconds < 10)
				time += "00";
			else if(_milliseconds < 100)
				time += "0";
			
			time += _milliseconds.toString();
		}
	}
}