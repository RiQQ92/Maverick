package objects
{
	import UIelements.Button;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class YhdistelyTekstiButton extends Sprite
	{
		private var _ID:String;
		private var clickFunc:Function;
		
		private var sound:Sound;
		private var myStage:Stage;
		
		private var soundBtn:Button = new Button("Aani_nappi");
		private var bg:Button = new Button("YhdistelyBtn_bg");
		
		private var text:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		public function YhdistelyTekstiButton(_text:String, _sound:String, _stage:Stage)
		{
			super();
			
			_ID = _text;
			_ID = Assets.removeChars("-", _ID);
			
			font.size = 30;
			font.align = TextFormatAlign.CENTER;
			
			text.selectable = false;
			text.defaultTextFormat = font;
			text.width = bg.width;
			text.height = bg.height/3.25;
			text.text = _text;
			
			myStage = _stage;
			//sound = Assets.getSound(_sound);
			
			bg.scaleY = 0.35;
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			text.x = bg.width/3 - text.width/2;
			text.y = bg.height/2 - text.height/2;
			this.addChild(text);
			
			soundBtn.x = (bg.width - bg.width/6) - soundBtn.width/2;
			soundBtn.y = bg.height/2 - soundBtn.height/2;
			this.addChild(soundBtn);
			soundBtn.addEventListener(MouseEvent.CLICK, onClickSound);
		}
		
		public function addListener(eventFunc:Function):void
		{
			clickFunc = eventFunc;
			bg.addEventListener(MouseEvent.CLICK, clickFunc);
			text.addEventListener(MouseEvent.CLICK, clickFunc);
		}
		
		public function get ID():String
		{
			return _ID;
		}

		protected function onClickSound(event:MouseEvent):void
		{
			//sound.play();
		}
		
		public function Destruct():void
		{
			bg.removeEventListener(MouseEvent.CLICK, clickFunc);
			text.removeEventListener(MouseEvent.CLICK, clickFunc);
			clickFunc = null;
		}
	}
}