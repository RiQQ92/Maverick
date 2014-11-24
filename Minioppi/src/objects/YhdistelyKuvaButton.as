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
		
		private var soundBtn:Button = new Button("Aani_nappi");
		private var bg:Button = new Button("YhdistelyBtn_bg");
		private var image:Button;
		
		private var clickFunc:Function;
		
		public function YhdistelyKuvaButton(_image:String, _sound:String, _stage:Stage)
		{
			super();
			
			_ID = Assets.removeChars("-", _image);
			myStage = _stage;
			image = new Button("Yhdistely_"+_ID+"_kuva");
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
		
		public function addListener(eventFunc:Function):void
		{
			clickFunc = eventFunc;
			bg.addEventListener(MouseEvent.CLICK, clickFunc);
			image.addEventListener(MouseEvent.CLICK, clickFunc);
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
			image.removeEventListener(MouseEvent.CLICK, clickFunc);
			clickFunc = null;
		}
	}
}