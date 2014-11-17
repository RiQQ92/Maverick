package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import utility.VCam;
	
	public class Player extends Sprite
	{
		private var image:Bitmap;
		
		private var keyUp:Boolean = false;
		private var keyDown:Boolean = false;
		private var keyLeft:Boolean = false;
		private var keyRight:Boolean = false;
		
		private var lastMoveX:int = 0;
		private var lastMoveY:int = 0;
		private var _speed:int = 5;
		
		private var myStage:Stage;
		private var lab:Maze;
		private var cam:VCam;
		private var creator:*;
		
		public function Player(_stage:Stage, _creator:*, _lab:Maze)
		{
			super();
			
			lab = _lab;
			myStage = _stage;
			creator = _creator;
			cam = new VCam(myStage, this, creator);
			image = Assets.getTexture("Labyrintti_pelaaja");
			this.addChild(image);
		}
		
		public function get speed():int
		{
			return _speed;
		}

		public function set speed(value:int):void
		{
			_speed = value;
		}
		
		public function Destruct():void
		{
			lab = null;
			creator = null;
			cam.Destruct();
			cam = null;
			this.removeChild(image);
			
			myStage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.removeEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.removeEventListener(Event.ENTER_FRAME, update);
		}
		
		public function addListeners():void
		{
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function removeListeners():void
		{
			myStage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.removeEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					this.keyUp = true;
					break;
				case Keyboard.DOWN:
					
					this.keyDown = true;
					break;
				case Keyboard.LEFT:
					
					this.keyLeft = true;
					break;
				case Keyboard.RIGHT:
					
					this.keyRight = true;
					break;
			}
		}
		
		private function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					
					this.keyUp = false;
					break;
				case Keyboard.DOWN:
					
					this.keyDown = false;
					break;
				case Keyboard.LEFT:
					
					this.keyLeft = false;
					break;
				case Keyboard.RIGHT:
					
					this.keyRight = false;
					break;
			}
		}
		
		private function update(event:Event):void
		{
			if(keyUp)
			{
				if((this.y) > 0)
				{
					this.y -= this.speed;
					lastMoveY -= this.speed;
				}
			}
			if(keyDown)
			{
				if((this.y + this.height) < creator.height)
				{
					this.y += this.speed;
					lastMoveY += this.speed;
				}
			}
			if(keyLeft)
			{
				if((this.x) > 0)
				{
					this.x -= this.speed;
					lastMoveX -= this.speed;
				}
			}
			if(keyRight)
			{
				if((this.x + this.width) < creator.width)
				{
					this.x += this.speed;
					lastMoveX += this.speed;
				}
			}
			
			if(lastMoveX != 0 || lastMoveY != 0)
			{
				for(var i:int; i < lab.wallList.length; i++)
				{
					if(this.hitTestObject(lab.wallList[i]))
					{
						if(lastMoveX != 0 && lastMoveY != 0)
						{
							// jos tämän vasen reuna ylittää kohteen oikeanreunan ja on liikkumassa vasemmalle ja keskikohta on seinän keskikohdan oikeallapuolelle
							if(this.x-5 < (lab.wallList[i].x + lab.wallList[i].width) && lastMoveX < 0 && (this.x + this.width/2) > (lab.wallList[i].x + lab.wallList[i].width/2))
							{
								if(this.y + this.height -5 > (lab.wallList[i].y) && this.y < (lab.wallList[i].y + lab.wallList[i].height -5))
									this.x -= lastMoveX;
							}
							else if((this.x + this.width) > lab.wallList[i].x && lastMoveX > 0 && (this.x + this.width/2) < (lab.wallList[i].x + lab.wallList[i].width/2))
							{
								if(this.y + this.height -5 > (lab.wallList[i].y) && this.y < (lab.wallList[i].y + lab.wallList[i].height -5))
									this.x -= lastMoveX;
							}
							
							
							if(this.y-5 < (lab.wallList[i].y + lab.wallList[i].height) && lastMoveY < 0 && (this.y + this.height/2) > (lab.wallList[i].y + lab.wallList[i].height/2))
							{
								if(this.x + this.width -5 > (lab.wallList[i].x) && this.x < (lab.wallList[i].x + lab.wallList[i].width -5))
									this.y -= lastMoveY;
							}
							else if((this.y + this.height) > lab.wallList[i].y && lastMoveY > 0 && (this.y + this.height/2) < (lab.wallList[i].y + lab.wallList[i].height/2))
							{
								if(this.x + this.width -5 > (lab.wallList[i].x) && this.x < (lab.wallList[i].x + lab.wallList[i].width -5))
									this.y -= lastMoveY;
							}
						}
						
						else if(lastMoveX != 0)
						{
							this.x -= lastMoveX;
						}
						else
						{
							this.y -= lastMoveY;
						}
					}
				}
			}
			
			lastMoveX = 0;
			lastMoveY = 0;
		}
	}
}