package UIelements
{
	import UIelements.Button;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class TextButton extends Sprite
	{
		private var _ID:String;
		private var myStage:Stage;
		private var clickPressFunc:Function;
		private var clickReleaseFunc:Function;
		
		private var bg:Button = new Button("YhdistelyBtn_bg");
		
		private var font:TextFormat = new TextFormat();
		public var text:TextField = new TextField();
		
		public function TextButton(_text:String, _stage:Stage)
		{
			super();
			
			myStage = _stage;
			
			_ID = _text;
			_ID = Assets.removeChars("-", _ID);
			var pattern:RegExp = /ae/g;
			_text = _text.replace(pattern, "ä");
			
			font.size = 20;
			font.color = 0x000000;
			font.align = TextFormatAlign.CENTER;
			
			text.selectable = false;
			text.defaultTextFormat = font;
			text.width = bg.width;
			text.height = bg.height/3.25;
			text.text = _text;
			
			bg.scaleY = 0.35;
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			text.x = bg.width/2 - text.width/2;
			text.y = bg.height/2 - text.height/2;
			this.addChild(text);
		}
		
		public function Destruct():void
		{
			bg.removeEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
			text.removeEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
			clickPressFunc = null;
			
			bg.removeEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			text.removeEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			clickReleaseFunc = null;
		}
	}
}