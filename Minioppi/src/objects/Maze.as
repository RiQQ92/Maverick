package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import utility.MazeGenerator;
	
	public class Maze extends Sprite
	{
		private var myStage:Stage;
		
		private var roadList:Array = new Array();
		
		private var maze:MazeGenerator = new MazeGenerator();
		
		public var wallList:Array = new Array();
		
		public function Maze(mazeWidth:int, mazeHeight:int, _stage:Stage)
		{
			super();
			
			myStage = _stage;
			
			var arr:Array = maze.generateMaze(mazeWidth, mazeHeight);
			if(arr != null)
			for (var row:int = 0; row < arr.length; row++)
			{
				for (var col:int = 0; col < arr[0].length; col++)
				{
					if(arr[row][col])
					{
						var road:Bitmap = Assets.getTexture("Labyrintti_tie");
						road.scaleX = myStage.stageWidth/(mazeWidth*road.width);
						road.scaleY = myStage.stageHeight/(mazeHeight*road.height);
						road.x = road.width*row;
						road.y = road.height*col;
						this.addChild(road);
						roadList.push(road);
					}
					else
					{
						var wall:Bitmap = Assets.getTexture("Labyrintti_seina");
						wall.scaleX = myStage.stageWidth/(mazeWidth*wall.width);
						wall.scaleY = myStage.stageHeight/(mazeHeight*wall.height);
						wall.x = wall.width*row;
						wall.y = wall.height*col;
						this.addChild(wall);
						wallList.push(wall);
					}
				}
			}
		}
	}
}