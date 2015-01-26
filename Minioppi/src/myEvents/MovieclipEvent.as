package myEvents
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MovieclipEvent extends MovieClip
	{
		// constants
		public const ANIMATION_COMPLETE:String = "animation_complete";
		
		/**
		 * Constructor
		 */
		public function MovieclipEvent()
		{
			addEventListener(Event.ENTER_FRAME, _handle);
		}
		
		/**
		 * Called on dispatch of Event.ENTER_FRAME
		 */
		private function _handle(e:Event):void
		{
			if(currentFrame == totalFrames)
			{
				var evt:Event = new Event(ANIMATION_COMPLETE);
				dispatchEvent(evt);
			}
		}
	}
}