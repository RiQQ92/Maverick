package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.sampler.StackFrame;
	
	import screens.Menu;
	import screens.Muistipeli;
	
	public class ScreenHandler extends Sprite
	{
		public var myStage:Stage;
		public var menu:Menu;
		public var muistipeli:Muistipeli;
		
		private var _inScreen:String;
		
		public function ScreenHandler(_stage:Stage)
		{
			super();
			myStage = _stage;
			menu = new Menu(myStage, this);
			muistipeli = new Muistipeli();
			inScreen = "menu";
		}
		
		
		
		public function get inScreen():String
		{
			return _inScreen;
		}
		
		public function set inScreen(value:String):void
		{
			if (value == "menu")
			{
				menu.x = 0;
				menu.y = 0;
				this.addChild(menu);
			}
			else if (value == "muistipeli")
			{
				muistipeli.x = 0;
				muistipeli.y = 0;
				this.addChild(muistipeli);
			}
			
			_inScreen = value;
		}
	}
}