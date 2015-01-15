package utility
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class TimerBar extends CountTime
	{
		private var timeText:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		private var bg:Bitmap = Assets.getTexture("TimerBar");
		
		public function TimerBar(_countDown:Boolean = false, countMins:int = 2, countSecs:int = 30)
		{
			super(_countDown, countMins, countSecs);
			
			font.size = 30;
			font.align = TextFormatAlign.LEFT;
			
			timeText.selectable = false;
			timeText.defaultTextFormat = font;
			timeText.wordWrap = true;
			timeText.multiline = true;
			timeText.width = bg.width;
			timeText.height = bg.height;
			timeText.text = super.printTime();
			timeText.autoSize = TextFieldAutoSize.CENTER;
			
			this.addChild(bg);
			this.addChild(timeText);
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			timeText.text = super.printTime();
		}
		
		public function reset():void
		{
			super.Reset();
		}
		
		public function stop():void
		{
			super.Stop();
		}
		
		public function resume():void
		{
			super.Continue();
		}
		
		public function destruct():void
		{
			this.removeEventListener(Event.ENTER_FRAME, update);
			super.Destruct();
		}
	}
}