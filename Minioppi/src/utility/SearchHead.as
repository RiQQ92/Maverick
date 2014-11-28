package utility
{
	internal class SearchHead
	{
		private var parentClass:PathFinder;
		private var lastMove:String;
		
		public var posX:int;
		public var posY:int;
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
			var straightPossible:Boolean = false;
			
			var up:Boolean = false;
			var down:Boolean = false;
			var left:Boolean = false;
			var right:Boolean = false;
			
			var freePath:Boolean = false;
			var possiblePaths:int = 0;
			
			if(checkUp() && lastMove != "down")
			{
				possiblePaths++;
				up = true;
				if(lastMove == "up")
					straightPossible = true;
			}
			if(checkDown() && lastMove != "up")
			{
				possiblePaths++;
				down = true;
				if(lastMove == "down")
					straightPossible = true;
			}
			if(checkLeft() && lastMove != "right")
			{
				possiblePaths++;
				left = true;
				if(lastMove == "left")
					straightPossible = true;
			}
			if(checkRight() && lastMove != "left")
			{
				possiblePaths++;
				right = true;
				if(lastMove == "right")
					straightPossible = true;
			}
			
			if(possiblePaths > 2)
			{
				freePath = true;
				switch(lastMove)
				{
					case "up":
						createSearcher(posX+1, posY, "right");
						createSearcher(posX-1, posY, "left");
						moveTo("up");
						break;
					
					case "down":
						createSearcher(posX+1, posY, "right");
						createSearcher(posX-1, posY, "left");
						moveTo("down");
						break;
					
					case "left":
						createSearcher(posX, posY-1, "up");
						createSearcher(posX, posY+1, "down");
						moveTo("left");
						break;
					
					case "right":
						createSearcher(posX, posY-1, "up");
						createSearcher(posX, posY+1, "down");
						moveTo("right");
						break;
					
					default:
						break;
				}
			}
			else if(possiblePaths > 1)
			{
				freePath = true;
				if(straightPossible)
				{
					switch(lastMove)
					{
						case "up":
							if(right)
								createSearcher(posX+1, posY, "right");
							else
								createSearcher(posX-1, posY, "left");
							moveTo("up");
							break;
						
						case "down":
							if(right)
								createSearcher(posX+1, posY, "right");
							else
								createSearcher(posX-1, posY, "left");
							moveTo("down");
							break;
						
						case "left":
							if(up)
								createSearcher(posX, posY-1, "up");
							else
								createSearcher(posX, posY+1, "down");
							moveTo("left");
							break;
						
						case "right":
							if(up)
								createSearcher(posX, posY-1, "up");
							else
								createSearcher(posX, posY+1, "down");
							moveTo("right");
							break;
						default:
							break;
					}
				}
				else
				{
					switch(lastMove)
					{
						case "up":
							createSearcher(posX-1, posY, "left");
							moveTo("right");
							break;
						
						case "down":
							createSearcher(posX-1, posY, "left");
							moveTo("right");
							break;
						
						case "left":
							createSearcher(posX, posY+1, "down");
							moveTo("up");
							break;
						
						case "right":
							createSearcher(posX, posY+1, "down");
							moveTo("up");
							break;
						
						default:
							break;
					}
				}
			}
			else if(possiblePaths > 0)
			{
				freePath = true;
				if(up)
				{
					moveTo("up");
				}
				else if(down)
				{
					moveTo("down");
				}
				else if(left)
				{
					moveTo("left");
				}
				else if(right)
				{
					moveTo("right");
				}
			}
			
			return freePath;
		}
		
		private function createSearcher(_x:int, _y:int, dir:String):void
		{
			var temp:Array = moves.concat();
			temp.push(dir);
			parentClass.addSearcher(_x, _y, pathWidth, pathHeight, _tilesTraversed, path, temp);
		}
		
		private function moveTo(to:String):void
		{
			lastMove = to;
			moves.push(lastMove);
			
			_tilesTraversed++;
			
			switch(to)
			{
				case "up":
					posY--;
					break;
				case "down":
					posY++;
					break;
				case "left":
					posX--;
					break;
				case "right":
					posX++;
					break;
			}
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
}