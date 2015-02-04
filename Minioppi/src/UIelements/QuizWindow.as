package UIelements
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	
	import objects.YhdistelyTekstiButton;
	
	public class QuizWindow extends Sprite
	{
		private var arwAnimNames:Array;
		
		private var correctAnim:String;
		
		private var txt1:YhdistelyTekstiButton;
		private var txt2:YhdistelyTekstiButton;
		private var txt3:YhdistelyTekstiButton;
		
		private var myStage:Stage;
		private var func:Function;
		private var bg:Bitmap = Assets.getTexture("OhjePohja");
		private var image:Bitmap;
		
		public function QuizWindow(anim:String, functionToCall:Function, stage:Stage)
		{
			super();
			
			myStage = stage;
			
			correctAnim = anim;
			bg.scaleY = 0.5;
			
			func = functionToCall;
			
			if(myStage.mouseY < myStage.stageHeight/2)
				this.y = myStage.stageHeight/2;
			
			
			var _ID:String = Assets.removeChars("-", anim);
			
			image = Assets.getTexture("Yhdistely_"+_ID+"_kuva");
			image.scaleX = 1.2;
			image.scaleY = 1.2;
			image.x = (bg.width/3)*2 -image.width/2;
			image.y = bg.height/2 -image.height/2;
			
			initAnimNames();
			listButtons();
			Draw();
		}
		
		private function initAnimNames():void
		{
			arwAnimNames = new Array();
			
			arwAnimNames.push("Ket-tu");
			arwAnimNames.push("Kar-hu");
			arwAnimNames.push("Su-si");
			arwAnimNames.push("Sii-li");
			arwAnimNames.push("O-ra-va");
			arwAnimNames.push("Leh-mae");
			arwAnimNames.push("Koi-ra");
			arwAnimNames.push("Si-ka");
			arwAnimNames.push("Ank-ka");
			arwAnimNames.push("Ka-na");
			arwAnimNames.push("Lam-mas");
			arwAnimNames.push("Le-pak-ko");
			arwAnimNames.push("Vuo-hi");
			arwAnimNames.push("Sam-mak-ko");
			arwAnimNames.push("Kil-pi-kon-na");
			arwAnimNames.push("Un-du-laat-ti");
			arwAnimNames.push("Ra-pu");
			arwAnimNames.push("Ki-ma-lai-nen");
			arwAnimNames.push("Jout-sen");
			arwAnimNames.push("E-ta-na");
			arwAnimNames.push("Haa-ra-paeaes-ky");
			arwAnimNames.push("Ha-rak-ka");
			arwAnimNames.push("Hams-te-ri");
			arwAnimNames.push("Jae-nis");
			arwAnimNames.push("Peip-po");
			arwAnimNames.push("Sor-sa");
			/*ei toimi*/
			//arwAnimNames.push("Kuk-ko");
			//arwAnimNames.push("Per-ho-nen");
			//arwAnimNames.push("Si-si-lis-ko");
		}
		
		private function Draw():void
		{
			this.addChild(bg);
			this.addChild(image);
			
			this.addChild(txt1);
			this.addChild(txt2);
			this.addChild(txt3);
		}
		
		private function listButtons():void
		{
			// add animal names here first into array 'arwAnimNames'
			var arrAnims:Array = getRandomAnimNames(2);
			arrAnims.push(correctAnim);
			
			// random pos for right answer
			var rand:int = Math.ceil(Math.random()*arrAnims.length)-1;
				
			for(var i:int = arrAnims.length-1; i > rand; i--)
			{
				var temp:String = arrAnims[i];
				arrAnims[i] = arrAnims[i-1];
				arrAnims[i-1] = temp;
			}
			
			// set texts to boxes
			txt1 = new YhdistelyTekstiButton(arrAnims[0], arrAnims[0], myStage);
			txt1.x = bg.width/2 - txt1.width;
			txt1.y = 50;
			txt1.buttonMode = true;
			
			txt2 = new YhdistelyTekstiButton(arrAnims[1], arrAnims[1], myStage);
			txt2.x = bg.width/2 - txt2.width;
			txt2.y = 50 + 10 + txt2.height*1;
			txt2.buttonMode = true;
			
			txt3 = new YhdistelyTekstiButton(arrAnims[2], arrAnims[2], myStage);
			txt3.x = bg.width/2 - txt3.width;
			txt3.y = 50 + 20 + txt3.height*2;
			txt3.buttonMode = true;
			
			// set valid answer box
			if(rand == 0)
				txt1.addListenerOnRelease(func);
			else if(rand == 1)
				txt2.addListenerOnRelease(func);
			else
				txt3.addListenerOnRelease(func);
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
					
					var rand:int = Math.ceil(Math.random()*arwAnimNames.length)-1;
					pickedAnim = arwAnimNames[rand];
					if(pickedAnim != correctAnim)
					{
						for(var b:int = 0; b < arwPickedAnims.length; b++)
						{
							if(pickedAnim == arwPickedAnims[b])
							{
								animalPickedAlready = true;
								break;
							}
						}
					}
					else
					{
						animalPickedAlready = true;
					}
				}while(animalPickedAlready);
				
				arwPickedAnims.push(pickedAnim);
			}
			
			return arwPickedAnims;
		}
	}
}