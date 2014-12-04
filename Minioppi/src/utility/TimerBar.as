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
		private var time:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		private var bg:Bitmap = Assets.getTexture("TimerBar");
		
		public function TimerBar(_countDown:Boolean = false, countMins:int = 2, countSecs:int = 30)
		{
			super(_countDown, countMins, countSecs);
			
			font.size = 30;
			font.align = TextFormatAlign.LEFT;
			
			time.selectable = false;
			time.defaultTextFormat = font;
			time.wordWrap = true;
			time.multiline = true;
			time.width = bg.width;
			time.height = bg.height;
			time.text = super.printTime();
			time.autoSize = TextFieldAutoSize.CENTER;
			
			this.addChild(bg);
			this.addChild(time);
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(event:Event):void
		{
			time.text = super.printTime();
		}
		
		public function reset():void
		{
			super.Reset();
		}
		
		public function stop():void
		{
			super.Stop();
		}
	}
}