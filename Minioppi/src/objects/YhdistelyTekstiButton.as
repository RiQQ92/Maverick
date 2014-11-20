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
		private var sound:Sound;
		private var myStage:Stage;
		
		private var soundBtn:Button = new Button("Yhdistely_aaniNappi");
		private var bg:Button = new Button("YhdistelyBtn_bg");
		
		private var text:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		public function YhdistelyTekstiButton(_text:String, _sound:String, _stage:Stage)
		{
			super();
			
			font.size = 30;
			font.align = TextFormatAlign.CENTER;
			
			text.defaultTextFormat = font;
			text.width = bg.width;
			text.height = bg.height;
			text.text = _text;
			
			myStage = _stage;
			sound = Assets.getSound(_sound);
			
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			text.x = bg.width/3 - text.width/2;
			text.y = bg.height/2 - text.height/2;
			this.addChild(text);
			
			soundBtn.x = (bg.width - bg.width/10) - soundBtn.width/2;
			soundBtn.y = bg.height/2 - soundBtn.height/2;
			this.addChild(soundBtn);
			soundBtn.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			sound.play();
		}
	}
}