package
{
	import flash.display.Sprite;
	import utility.ScreenHandler;
	
	[SWF(frameRate="30", width="640", height="480", backgroundColor= "0x333333")]
	public class Minioppi extends Sprite
	{
		public var screenHandler:ScreenHandler;
		
		public function Minioppi()
		{
			screenHandler = new ScreenHandler(stage);
			this.addChild(screenHandler);
			screenHandler.inScreen = "menu";
		}
	}
}