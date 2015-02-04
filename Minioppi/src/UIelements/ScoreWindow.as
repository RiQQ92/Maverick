package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class ScoreWindow extends Sprite
	{
		private var myStage:Stage;
		private var counter:int = 0;
		private var func:Function;
		private var text:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		private var bg:Bitmap = Assets.getTexture("OhjePohja");
		
		public function ScoreWindow(score:String, functionToCall:Function, stage:Stage)
		{
			super();
			
			myStage = stage;
			func = functionToCall;
			
			font.size = 40;
			font.align = TextFormatAlign.CENTER;
			
			text.selectable = false;
			text.defaultTextFormat = font;
			text.wordWrap = true;
			text.multiline = true;
			text.autoSize = TextFieldAutoSize.CENTER;
			text.width = bg.width-200;
			text.text = score;
			text.x = myStage.stageWidth/2 - text.width/2;
			text.y = myStage.stageHeight/2 -text.height/2;
			
			this.addChild(bg);
			this.addChild(text);
			
			this.addEventListener(Event.ENTER_FRAME, wait);
		}
		
		private function wait(event:Event):void
		{
			if(counter > 30*2)
			{
				this.removeEventListener(Event.ENTER_FRAME, wait);
				this.addEventListener(MouseEvent.CLICK, func);
			}
			counter++;
		}
	}
}