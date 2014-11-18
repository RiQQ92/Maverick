package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	
	public class DebugText extends Sprite
	{
		private var output:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		private var myStage:Stage;
		
		public function DebugText(data:String, _stage:Stage)
		{
			super();
			font.size = 20;
			font.align = TextFormatAlign.CENTER;
			
			myStage = _stage;
			
			output.defaultTextFormat = font;
			output.background = true;
			output.width = 400;
			output.height = 300;
			output.multiline = true;
			output.wordWrap = true;
			output.x = myStage.stageWidth/2 - output.width/2;
			output.y = myStage.stageHeight/2 - output.height/2;
			
			if(data == null || data == '\0' || data == "")
				output.text = "no information sent!";
			else
			{
				output.text = data;
			}
			
			this.addChild(output);
			myStage.addEventListener(KeyboardEvent.KEY_UP, remove);
		}
		
		protected function remove(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.ESCAPE)
			{
				this.removeChild(output);
				myStage.removeEventListener(KeyboardEvent.KEY_UP, remove);		
			}
		}
	}
}