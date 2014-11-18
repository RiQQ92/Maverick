package utility
{
	import flash.display.Stage;
	import flash.geom.Point;

	public class MazeGenerator
	{
		private var labyrinthFinished:Boolean;
		
		private var mazeWidth:int;
		private var mazeHeight:int;
		
		private var mazeRoad:Array = new Array();
		private var mazeReserved:Array = new Array();
		private var moveHistory:Array = new Array();
		private var boolArrayRoad:Array;
		private var boolArrayReserved:Array;
		
		private var builderHeadPos:Point;
		
		private var lastMove:String;
		
		public function MazeGenerator()
		{
			mazeWidth = 0;
			mazeHeight = 0;
			builderHeadPos = new Point(0, 0);
			lastMove = "down";
		}
		
		public function generateMaze(rows:int, columns:int):Array
		{
			labyrinthFinished = false;
			
			mazeWidth = rows;
			mazeHeight = columns;
			
			for (var row:int = 0; row < rows; row++)
			{
				boolArrayRoad = new Array();
				boolArrayReserved = new Array();
				
				for (var col:int = 0; col < columns; col++)
				{
					boolArrayRoad.push(false);
					boolArrayReserved.push(false);
				}
				
				mazeRoad.push(boolArrayRoad);
				mazeReserved.push(boolArrayReserved);
			}
			
			mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
			reserveSurrounding();
			
			createPath();
			
			checkMaze();
			
			return(mazeRoad);
		}
		
		// rakentaa tietä
		private function createPath():void
		{
			while(!labyrinthFinished)
			{
				if(!checkUp(builderHeadPos.x, builderHeadPos.y-2) || !checkDown(builderHeadPos.x, builderHeadPos.y+2) || !checkLeft(builderHeadPos.x-2, builderHeadPos.y) || !checkRight(builderHeadPos.x+2, builderHeadPos.y))
				{
					chooseDirection();
				}
				else
				{
					reversePath();
				}
			}
		}
		
		// etsii ja satunnaisesti valitsee vapaan suunnan mahdollisista
		private function chooseDirection():void
		{
			var upFree:Boolean = false;
			var downFree:Boolean = false;
			var leftFree:Boolean = false;
			var rightFree:Boolean = false;
			var increasedChances:Boolean = false;
			
			var freePaths:int = 0;
			
			switch(lastMove)
			{
				case "up":
					if(!checkUp(builderHeadPos.x, builderHeadPos.y-2) && checkPoint(builderHeadPos.x, builderHeadPos.y-2, false))
					{
						upFree = true;
						increasedChances = true;
						freePaths++;
					}
					if(!checkLeft(builderHeadPos.x-2, builderHeadPos.y) && checkPoint(builderHeadPos.x-2, builderHeadPos.y, false))
					{
						leftFree = true;
						freePaths++;
					}
					if(!checkRight(builderHeadPos.x+2, builderHeadPos.y) && checkPoint(builderHeadPos.x+2, builderHeadPos.y, false))
					{
						rightFree = true;
						freePaths++;
					}
					break;
				case "down":
					if(!checkDown(builderHeadPos.x, builderHeadPos.y+2) && checkPoint(builderHeadPos.x, builderHeadPos.y+2, false))
					{
						downFree = true;
						increasedChances = true;
						freePaths++;
					}
					if(!checkLeft(builderHeadPos.x-2, builderHeadPos.y) && checkPoint(builderHeadPos.x-2, builderHeadPos.y, false))
					{
						leftFree = true;
						freePaths++;
					}
					if(!checkRight(builderHeadPos.x+2, builderHeadPos.y) && checkPoint(builderHeadPos.x+2, builderHeadPos.y, false))
					{
						rightFree = true;
						freePaths++;
					}
					break;
				case "left":
					if(!checkUp(builderHeadPos.x, builderHeadPos.y-2) && checkPoint(builderHeadPos.x, builderHeadPos.y-2, false))
					{
						upFree = true;
						freePaths++;
					}
					if(!checkDown(builderHeadPos.x, builderHeadPos.y+2) && checkPoint(builderHeadPos.x, builderHeadPos.y+2, false))
					{
						downFree = true;
						freePaths++;
					}
					if(!checkLeft(builderHeadPos.x-2, builderHeadPos.y) && checkPoint(builderHeadPos.x-2, builderHeadPos.y, false))
					{
						leftFree = true;
						increasedChances = true;
						freePaths++;
					}
					break;
				case "right":
					if(!checkUp(builderHeadPos.x, builderHeadPos.y-2) && checkPoint(builderHeadPos.x, builderHeadPos.y-2, false))
					{
						upFree = true;
						freePaths++;
					}
					if(!checkDown(builderHeadPos.x, builderHeadPos.y+2) && checkPoint(builderHeadPos.x, builderHeadPos.y+2, false))
					{
						downFree = true;
						freePaths++;
					}
					if(!checkRight(builderHeadPos.x+2, builderHeadPos.y) && checkPoint(builderHeadPos.x+2, builderHeadPos.y, false))
					{
						rightFree = true;
						increasedChances = true;
						freePaths++;
					}
					break;
				default:
					
					break;
			}
			var rand:Number = Math.random();
			
			if(freePaths > 0)
			{
				switch(freePaths)
				{
					case 1: // yksi mahdollinen reitti
						if(upFree)
							createRoadPart("up");
						else if(downFree)
							createRoadPart("down");
						else if(leftFree)
							createRoadPart("left");
						else
							createRoadPart("right");
						break;
					
					case 2: // Kaksi mahdollista reittiä
						if(increasedChances) // suoraan jatkamisen mahdollisuus
						{
							if(rand < 0.66)
								createRoadPart(lastMove);
							else
							{
								switch(lastMove)
								{
									case "up":
										if(rightFree)
											createRoadPart("right");
										else
											createRoadPart("left");
										break;
									case "down":
										if(rightFree)
											createRoadPart("right");
										else
											createRoadPart("left");
										break;
									case "left":
										if(upFree)
											createRoadPart("up");
										else
											createRoadPart("down");
										break;
									case "right":
										if(upFree)
											createRoadPart("up");
										else
											createRoadPart("down");
										break;
								}
							}
						}
						else
						{
							if(rand < 0.5)
							{
								switch(lastMove)
								{
									case "up":
										createRoadPart("left");
										break;
									case "down":
										createRoadPart("right");
										break;
									case "left":
										createRoadPart("up");
										break;
									case "right":
										createRoadPart("down");
										break;
								}
							}
							else
							{
								switch(lastMove)
								{
									case "up":
										createRoadPart("right");
										break;
									case "down":
										createRoadPart("left");
										break;
									case "left":
										createRoadPart("down");
										break;
									case "right":
										createRoadPart("up");
										break;
								}
							}
						}
						break;
					
					case 3:
						if(rand > 0.25 && rand < 0.75)
							createRoadPart(lastMove);
						else if(rand < 0.25)
						{
							if(!upFree)
								createRoadPart("right");
							else if(!downFree)
								createRoadPart("left");
							else if(!leftFree)
								createRoadPart("up");
							else
								createRoadPart("down");
						}
						else
						{
							if(!upFree)
								createRoadPart("left");
							else if(!downFree)
								createRoadPart("right");
							else if(!leftFree)
								createRoadPart("down");
							else
								createRoadPart("up");
						}
						break;
				}
			}
			else
			{
				reversePath();
			}
		}
		
		// kun tulee umpikuja, pakittaa rakentamaansa tietä
		// kunnes löytyy vapaa sijainti, jos päätyy alkuun ja ei löydy mitään
		// ja vielä on varaamattomia paikkoja, siirtyy ensimmäiseen löydettyyn varaamattomaan paikkaan
		private function reversePath():void
		{
			if(moveHistory.length > 0)
			{
				var dir:String = moveHistory.pop();
				switch(dir)
				{
					case "up":
						builderHeadPos.y+=2;
						break;
					
					case "down":
						builderHeadPos.y-=2;
						break;
					
					case "left":
						builderHeadPos.x+=2;
						break;
					
					case "right":
						builderHeadPos.x-=2;
						break;
				}
			}
			else
			{
				findFreePath();
			}
		}
		
		// siirtää rakentajapään ensimmäiseen vapaan paikan viereen
		private function findFreePath():void
		{
			var foundFree:Boolean = false;
			var foundX:int = 0;
			var foundY:int = 0;
			
			for (var row:int = 0; row < mazeWidth; row+=2)
			{
				for (var col:int = 0; col < mazeHeight; col+=2)
				{
					if(!mazeReserved[row][col])
					{
						foundFree = true;
						foundX = row;
						foundY = col;
					}
					if(foundFree)
						break;
				}
				if(foundFree)
					break;
			}
			
			if(foundFree)
			{
				var found:Boolean = false;
				var searchHead:int = 0;
				while(!found)
				{
					searchHead++;
					
					if(foundX+searchHead < mazeWidth)
					{
						if(mazeRoad[foundX+searchHead][foundY])
						{
							builderHeadPos.x = foundX+searchHead;
							builderHeadPos.y = foundY;
							found = true;
							createRoadPart("left");
						}
					}
					if(foundY+searchHead < mazeHeight)
					{
						if(mazeRoad[foundX][foundY+searchHead])
						{
							builderHeadPos.x = foundX;
							builderHeadPos.y = foundY+searchHead;
							found = true;
							createRoadPart("up");
						}
					}
					if(foundX-searchHead >= 0)
					{
						if(mazeRoad[foundX-searchHead][foundY])
						{
							builderHeadPos.x = foundX-searchHead;
							builderHeadPos.y = foundY;
							found = true;
							createRoadPart("right");
						}
					}
					if(foundY-searchHead >= 0)
					{
						if(mazeRoad[foundX][foundY-searchHead])
						{
							builderHeadPos.x = foundX;
							builderHeadPos.y = foundY-searchHead;
							found = true;
							createRoadPart("down");
						}
					}
				}
			}
			else
			{
				labyrinthFinished = true;
			}
		}
		
		// luo palan tietä ja siirtyy siihen
		private function createRoadPart(dir:String):void
		{
			switch(dir)
			{
				case "up":
					builderHeadPos.y--;
					
					mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
					reserveSurrounding();
					
					builderHeadPos.y--;
					break;
				
				case "down":
					builderHeadPos.y++;
					
					mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
					reserveSurrounding();
					
					builderHeadPos.y++;
					break;
				
				case "left":
					builderHeadPos.x--;
					
					mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
					reserveSurrounding();
					
					builderHeadPos.x--;
					break;
				
				case "right":
					builderHeadPos.x++;
					
					mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
					reserveSurrounding();
					
					builderHeadPos.x++;
					break;
			}
			moveHistory.push(dir);
			lastMove = dir;
			
			mazeRoad[builderHeadPos.x][builderHeadPos.y] = true;
			reserveSurrounding();
		}
		
		// varaa ympärystän
		private function reserveSurrounding():void
		{
			// tämän hetkinen piste
			mazeReserved[builderHeadPos.x][builderHeadPos.y] = true;
			
			// ylempi piste
			if(builderHeadPos.y-1 >= 0)
				mazeReserved[builderHeadPos.x][builderHeadPos.y-1] = true;
			
			// alempi piste
			if(builderHeadPos.y+1 < mazeHeight)
				mazeReserved[builderHeadPos.x][builderHeadPos.y+1] = true;
			
			// vasemman puoleinen piste
			if(builderHeadPos.x-1 >= 0)
				mazeReserved[builderHeadPos.x-1][builderHeadPos.y] = true;
			
			// oikean puoleinen piste
			if(builderHeadPos.x+1 < mazeWidth)
				mazeReserved[builderHeadPos.x+1][builderHeadPos.y] = true;
		}
		
		// tarkistaa yhden pisteen onko siinä tietä
		private function checkPoint(_x:int, _y:int, checkForRoad:Boolean):Boolean
		{
			if(_x < 0 || _x >= mazeWidth || _y < 0 || _y >= mazeHeight)
				return false;
			
			if(checkForRoad)
				return mazeRoad[_x][_y];
			else
				return !mazeRoad[_x][_y];
		}
		
		// tarkastaa oman pisteen + muut paitsi vasemmalta
		private function checkRight(_x:int, _y:int):Boolean
		{
			var foundRoad:Boolean = false;
			if(_x >= 0 && _x < mazeWidth && _y >= 0 && _y < mazeHeight)
			{
				// katsoo oikealta
				if(_y+1 < mazeHeight)
				{
					if(mazeRoad[_x][_y+1])
						foundRoad = true;
				}
				if(_y-1 >= 0)
				{
					if(mazeRoad[_x][_y-1])
						foundRoad = true;
				}
				if(_x+1 < mazeWidth)
				{
					if(mazeRoad[_x+1][_y])
						foundRoad = true;
				}
				if(_x+1 < mazeWidth && _y-1 >= 0)
				{
					if(mazeRoad[_x+1][_y-1])
						foundRoad = true;
				}
				if(_x+1 < mazeWidth && _y+1 < mazeHeight)
				{
					if(mazeRoad[_x+1][_y+1])
						foundRoad = true;
				}
			}
			return foundRoad;
		}
		
		// tarkastaa oman pisteen + muut paitsi oikealta
		private function checkLeft(_x:int, _y:int):Boolean
		{
			var foundRoad:Boolean = false;
			if(_x >= 0 && _x < mazeWidth && _y >= 0 && _y < mazeHeight)
			{
				// katsoo vasemmalta
				if(_y+1 < mazeHeight)
				{
					if(mazeRoad[_x][_y+1])
						foundRoad = true;
				}
				if(_y-1 >= 0)
				{
					if(mazeRoad[_x][_y-1])
						foundRoad = true;
				}
				if(_x-1 >= 0)
				{
					if(mazeRoad[_x-1][_y])
						foundRoad = true;
				}
				if(_x-1 >= 0 && _y-1 >= 0)
				{
					if(mazeRoad[_x-1][_y-1])
						foundRoad = true;
				}
				if(_x-1 >= 0 && _y+1 < mazeHeight)
				{
					if(mazeRoad[_x-1][_y+1])
						foundRoad = true;
				}
			}
			return foundRoad;
		}
		
		// tarkastaa oman pisteen + muut paitsi ylhäältä
		private function checkDown(_x:int, _y:int):Boolean
		{
			var foundRoad:Boolean = false;
			if(_x >= 0 && _x < mazeWidth && _y >= 0 && _y < mazeHeight)
			{
				// katsoo alhaalta
				if(_x+1 < mazeWidth)
				{
					if(mazeRoad[_x+1][_y])
						foundRoad = true;
				}
				if(_x-1 >= 0)
				{
					if(mazeRoad[_x-1][_y])
						foundRoad = true;
				}
				if(_y+1 < mazeHeight)
				{
					if(mazeRoad[_x][_y+1])
						foundRoad = true;
				}
				if(_y+1 < mazeHeight && _x-1 >= 0)
				{
					if(mazeRoad[_x-1][_y+1])
						foundRoad = true;
				}
				if(_y+1 < mazeHeight && _x+1 < mazeWidth)
				{
					if(mazeRoad[_x+1][_y+1])
						foundRoad = true;
				}
			}
			return foundRoad;
		}
		
		// tarkastaa oman pisteen + muut paitsi alhaalta
		private function checkUp(_x:int, _y:int):Boolean
		{
			var foundRoad:Boolean = false;
			if(_x >= 0 && _x < mazeWidth && _y >= 0 && _y < mazeHeight)
			{
				// katsoo ylhäältä
				if(_x+1 < mazeWidth)
				{
					if(mazeRoad[_x+1][_y])
						foundRoad = true;
				}
				if(_x-1 >= 0)
				{
					if(mazeRoad[_x-1][_y])
						foundRoad = true;
				}
				if(_y-1 >= 0)
				{
					if(mazeRoad[_x][_y-1])
						foundRoad = true;
				}
				if(_y-1 >= 0 && _x-1 >= 0)
				{
					if(mazeRoad[_x-1][_y-1])
						foundRoad = true;
				}
				if(_y-1 >= 0 && _x+1 < mazeWidth)
				{
					if(mazeRoad[_x+1][_y-1])
						foundRoad = true;
				}
			}
			return foundRoad;
		}
		
		// tarkastaa jotta on mahdollista päästä maaliin
		private function checkMaze():Boolean
		{
			// tulostaa labyrintin konsoliin
			var mazeLayout:String = "|";
			for (var row:int = 0; row < mazeWidth; row++)
			{
				for (var col:int = 0; col < mazeHeight; col++)
				{
					if(!mazeRoad[row][col])
					{
						mazeLayout+="X";
					}
					else
					{
						mazeLayout+=" ";
					}
				}
				mazeLayout+="|\n|";
			}
			trace(mazeLayout);
			
			// find path from start to finnish
			return true;
		}
	}
}