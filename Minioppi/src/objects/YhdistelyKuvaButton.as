package objects
{
	import UIelements.Button;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	public class YhdistelyKuvaButton extends Sprite
	{
		private var _ID:String;
		
		private var sound:Sound;
		private var myStage:Stage;
		
		private var soundBtn:Button;
		private var bg:Button;
		public var image:Button;
		
		private var clickPressFunc:Function;
		private var clickReleaseFunc:Function;
		
		public function YhdistelyKuvaButton(_image:String, _sound:String, _stage:Stage, highlights:Boolean = true)
		{
			super();
			
			_ID = Assets.removeChars("-", _image);
			myStage = _stage;
			
			if(_sound != "")
				sound = Assets.getSound("Aani_"+_sound);
			
			soundBtn = new Button("Aani_nappi", highlights);
			bg = new Button("YhdistelyBtn_bg", highlights);
			image = new Button("Yhdistely_"+_ID+"_kuva", highlights);
			//sound = Assets.getSound(_sound+"_aani");
			
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			image.x = bg.width/2.5 - image.width/2;
			image.y = bg.height/2 - image.height/2;
			this.addChild(image);
			
			soundBtn.x = (bg.width - bg.width/6) - soundBtn.width/2;
			soundBtn.y = bg.height/2 - soundBtn.height/2;
			this.addChild(soundBtn);
			soundBtn.addEventListener(MouseEvent.CLICK, onClickSound);
		}
		
		public function setNewContent(str:String):void
		{
			_ID = str;
			
			image.updateImage("Yhdistely_"+_ID+"_kuva");
			image.x = bg.width/2.5 - image.width/2;
		}
		
		public function addListenerOnPress(eventFunc:Function):void
		{
			clickPressFunc = eventFunc;
			bg.addEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
			image.addEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
		}
		
		public function addListenerOnRelease(eventFunc:Function):void
		{
			clickReleaseFunc = eventFunc;
			bg.addEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			image.addEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
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
			image.removeEventListener(MouseEvent.MOUSE_DOWN, clickPressFunc);
			clickPressFunc = null;
			
			bg.removeEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			image.removeEventListener(MouseEvent.MOUSE_UP, clickReleaseFunc);
			clickReleaseFunc = null;
		}
	}
}