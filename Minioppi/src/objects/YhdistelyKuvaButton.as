package objects
{
	import UIelements.Button;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	public class YhdistelyKuvaButton extends Sprite
	{
		private var sound:Sound;
		private var myStage:Stage;
		
		private var soundBtn:Button = new Button("Yhdistely_aaniNappi");
		private var bg:Button = new Button("YhdistelyBtn_bg");
		private var image:Button;
		
		public function YhdistelyKuvaButton(_image:String, _sound:String, _stage:Stage)
		{
			super();
			
			myStage = _stage;
			image = new Button(_image);
			sound = Assets.getSound(_sound);
			
			bg.x = 0;
			bg.y = 0;
			this.addChild(bg);
			
			image.x = bg.width/3 - image.width/2;
			image.y = bg.height/2 - image.height/2;
			this.addChild(image);
			
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