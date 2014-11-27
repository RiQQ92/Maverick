package utility
{
	private class SearchHead
	{
		private var parentClass:PathFinder;
		private var lastMove:String;
		
		private var posX:int;
		private var posY:int;
		private var pathWidth:int;
		private var pathHeight:int;
		
		private var _tilesTraversed:int;
		
		private var moves:Array;
		private var path:Array;
		
		public function SearchHead(_posX:int, _posY:int, _pathWidth:int, _pathHeight:int, tilesTraversed:int, _path:Array, _moves:Array, _parentClass:PathFinder)
		{
			parentClass = _parentClass;
			
			pathWidth = _pathWidth;
			pathHeight = _pathHeight;
			
			posX = _posX;
			posY = _posY;
			
			_tilesTraversed = tilesTraversed;
			
			path = _path;
			moves = _moves;
			
			lastMove = moves[moves.length-1];
		}
		
		public function get tilesTraversed():int
		{
			return _tilesTraversed;
		}

		public function move():Boolean
		{
			var freePath:Boolean = false;
			var possiblePaths:int = 0;
			
			if(checkUp && lastMove != "up")
				possiblePaths++;
			if(checkDown && lastMove != "down")
				possiblePaths++;
			if(checkLeft && lastMove != "left")
				possiblePaths++;
			if(checkRight && lastMove != "right")
				possiblePaths++;
			
			return freePath;
		}
		
		private function checkUp():Boolean
		{
			if(posY -1 < 0)
				return false;
			else
				if(path[posX][posY-1])
					return true;
			
			return false;
		}
		
		private function checkDown():Boolean
		{
			if(posY +1 > pathHeight-1)
				return false;
			else
				if(path[posX][posY+1])
					return true;
			
			return false;
		}
		
		private function checkLeft():Boolean
		{
			if(posX -1 < 0)
				return false;
			else
				if(path[posX-1][posY])
					return true;
			
			return false;
		}
		
		private function checkRight():Boolean
		{
			if(posX +1 > pathWidth-1)
				return false;
			else
				if(path[posX+1][posY])
					return true;
			
			return false;
		}
	}
	
	public class PathFinder
	{
		private var goalX:int;
		private var goalY:int;
		private var searchers:Array;
		
		public function findPath(_goalX:int, _goalY:int, pathWidth:int, pathHeight:int,  path:Array):int
		{
			searchers = new Array();
			addSearcher(0, 0, pathWidth, pathHeight, 0, path, new Array());
			
			var goalFound:Boolean = false;
			var pathLength:int = 0;
			
			while(!goalFound)
			{
				for(var i:int = 0; i < searchers.length; i++)
				{
					if(!searchers[i].move())
					{
						delete (searchers[i]);
						searchers.splice(i, 1);
					}
					else if(searchers[i].x == goalX && searchers[i].y == goalY)
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