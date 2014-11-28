package utility
{	
	public class PathFinder
	{
		private var goalX:int;
		private var goalY:int;
		private var searchers:Array;
		
		public function findPath(_goalX:int, _goalY:int, pathWidth:int, pathHeight:int,  path:Array):int
		{
			var temp:Array = new Array();
			temp.push("down");
			searchers = new Array();
			addSearcher(0, 0, pathWidth, pathHeight, 0, path, temp);
			
			var goalFound:Boolean = false;
			var pathLength:int = 0;
			
			goalX = _goalX;
			goalY = _goalY;
			
			while(!goalFound)
			{
				for(var i:int = 0; i < searchers.length; i++)
				{
					if(!searchers[i].move())
					{
						delete (searchers[i]);
						searchers.splice(i, 1);
					}
					else if(searchers[i].posX == goalX && searchers[i].posY == goalY)
					{
						goalFound = true;
						pathLength = searchers[i].tilesTraversed;
						break;
					}
				}
			}
			
			return pathLength;
		}
		
		public function addSearcher(x:int, y:int, xw:int, yw:int, count:int, arr:Array, moves:Array):void
		{
			searchers.push(new SearchHead(x, y, xw, yw, count, arr, moves, this));
		}
	}
}