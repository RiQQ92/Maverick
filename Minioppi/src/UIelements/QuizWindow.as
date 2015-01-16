package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	
	public class QuizWindow extends Sprite
	{
		private var arwAnimNames:Array = new Array();
		
		private var correctAnim:String;
		
		private var txt1:TextButton;
		private var txt2:TextButton;
		private var txt3:TextButton;
		
		private var myStage:Stage;
		private var func:Function;
		private var bg:Bitmap = Assets.getTexture("OhjePohja");
		
		public function QuizWindow(anim:String, functionToCall:Function, stage:Stage)
		{
			super();
			
			correctAnim = anim;
			bg.scaleY = 0.5;
			
			func = functionToCall;
			
			listButtons();
			Draw();
		}
		
		private function Draw():void
		{
			this.addChild(bg);
			
			this.addChild(txt1);
			this.addChild(txt2);
			this.addChild(txt3);
		}
		
		private function listButtons():void
		{
			// add animal names here first into array 'arwAnimNames'
			//var arrAnims:Array = getRandomAnimNames(2);
			
			txt1 = new TextButton("kis-sa", myStage);
			txt1.x = bg.width/2 - txt1.width;
			txt1.y = 50;
			txt1.buttonMode = true;
			
			txt2 = new TextButton(correctAnim, myStage);
			txt2.addEventListener(MouseEvent.CLICK, func);
			txt2.x = bg.width/2 - txt2.width;
			txt2.y = 50 + 10 + txt2.height*1;
			txt2.buttonMode = true;
			
			txt3 = new TextButton("koi-ra", myStage);
			txt3.x = bg.width/2 - txt3.width;
			txt3.y = 50 + 20 + txt3.height*2;
			txt3.buttonMode = true;
		}
		
		private function getRandomAnimNames(amount:int):Array
		{
			var arwPickedAnims:Array = new Array();
			
			for(var i:int = 0; i < amount; i++)
			{
				var animalPickedAlready:Boolean;
				var pickedAnim:String;
				do{
					animalPickedAlready = false;
					
					var rand:int = Math.floor(Math.random()*arwAnimNames.length)-1;
					pickedAnim = arwAnimNames[rand];
					
					for(var b:int = 0; b < arwPickedAnims.length; b++)
					{
						if(pickedAnim == arwPickedAnims[b])
							animalPickedAlready = true;
					}
				}while(animalPickedAlready);
				
				arwPickedAnims.push(pickedAnim);
			}
			
			return arwPickedAnims;
		}
	}
}