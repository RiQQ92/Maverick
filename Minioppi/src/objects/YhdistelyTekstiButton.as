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
		private var clickPressFunc:Function;
		private var clickReleaseFunc:Function;
		
		private var sound:Sound;
		private var myStage:Stage;
		
		private var soundBtn:Button;
		private var bg:Button;
		
		public var text:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		public function YhdistelyTekstiButton(_text:String, _sound:String, _stage:Stage, highlights:Boolean = true)
		{
			super();
			
			_sound = Assets.removeChars("-", _sound);
			if(_sound != "")
				sound = Assets.getSound(_sound+"AaniSaneltu");
			
			soundBtn = new Button("Aani_nappi", highlights);
			bg = new Button("YhdistelyBtn_bg", highlights);
			
			_ID = _text;
			_ID = Assets.removeChars("-", _ID);
			var pattern:RegExp = /ae/g;
			_text = _text.replace(pattern, "ä");
			
			font.size = 20;
			font.align = TextFormatAlign.CENTER;
			
			text.selectable = false;
			text.mouseEnabled = false;
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
		
		public function setNewContent(str:String):void
		{
			_ID = str;
			_ID = Assets.removeChars("-", _ID);
			
			var pattern:RegExp = /ae/g;
			str = str.replace(pattern, "ä");
			
			text.text = str;
		}
		
		public function addListenerOnPress(eventFunc:Function):void
		{
			clickPressFunc = eventFunc;
			bg.addEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
		}
		
		public function addListenerOnRelease(eventFunc:Function):void
		{
			clickReleaseFunc = eventFunc;
			bg.addEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			text.addEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
		}
		
		public function get ID():String
		{
			return _ID;
		}

		protected function onClickSound(event:MouseEvent):void
		{
			sound.play();
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