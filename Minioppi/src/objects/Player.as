package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Player extends Sprite
	{
		private var image:Bitmap;
		
		private var keyUp:Boolean = false;
		private var keyDown:Boolean = false;
		private var keyLeft:Boolean = false;
		private var keyRight:Boolean = false;
		
		private var _speed:int = 5;
		
		private var myStage:Stage;
		
		public function Player(_stage:Stage)
		{
			super();
			
			myStage = _stage;
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
					this.y -= this.speed;	
			}
			if(keyDown)
			{
				if((this.y + this.height) < myStage.stageHeight)
					this.y += this.speed;	
			}
			if(keyLeft)
			{
				if((this.x) > 0)
					this.x -= this.speed;	
			}
			if(keyRight)
			{
				if((this.x + this.width) < myStage.stageWidth)
					this.x += this.speed;	
			}
		}
	}
}