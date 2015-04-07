package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import utility.ScreenHandler;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		private var loader:Loader = new Loader();
		private var mcMovie:MovieClip;
		public var screenHandler:ScreenHandler;
		
		public function Minioppi()
		{
			/** Error on loading video on finished build, removed due to lack of time **/
			/*
			var url:URLRequest = new URLRequest("../MovieClips/Metsa/maverick.swf");
			loader.load(url);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, startListener);
			*/
			screenHandler = new ScreenHandler(stage);
			this.addChild(screenHandler);
			screenHandler.inScreen = "menu";
		}
		
		private function startListener (e:Event):void
		{
			mcMovie = loader.content as MovieClip;
			this.addChild(mcMovie);
			mcMovie.play();
			mcMovie.addEventListener(Event.ENTER_FRAME, checkLastFrame);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, movieFinished);
			stage.addEventListener(MouseEvent.CLICK, movieFinished);
		}
		
		protected function checkLastFrame(event:Event):void
		{
			if(mcMovie.currentFrame == mcMovie.totalFrames)
			{
				movieFinishedEventless();
			}
		}
		
		private function movieFinished(e:Event):void
		{
			mcMovie.soundTransform.volume = 0;
			mcMovie.stop();
			this.removeChild(mcMovie);
			mcMovie = null;
			loader.unloadAndStop();
			loader = null;
			
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, movieFinished);
			stage.removeEventListener(MouseEvent.CLICK, movieFinished);
			
			screenHandler = new ScreenHandler(stage);
			this.addChild(screenHandler);
			screenHandler.inScreen = "menu";
		}
		
		private function movieFinishedEventless():void
		{
			mcMovie.soundTransform.volume = 0;
			mcMovie.stop();
			this.removeChild(mcMovie);
			mcMovie = null;
			loader.unloadAndStop();
			loader = null;
			
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, movieFinished);
			stage.removeEventListener(MouseEvent.CLICK, movieFinished);
			
			screenHandler = new ScreenHandler(stage);
			this.addChild(screenHandler);
			screenHandler.inScreen = "menu";
		}
	}
}