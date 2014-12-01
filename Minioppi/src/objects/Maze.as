package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import utility.MazeGenerator;
	
	public class Maze extends Sprite
	{
		private var fitToStage:Boolean = false;
		
		private var badAnimalAmount:int = 10;
		private var badAnimalCounter:int = 0;
		
		private var goodAnimalAmount:int = 10;
		private var goodAnimalCounter:int = 0;
		
		private var mazeX:int = 0;
		private var mazeY:int = 0;
		
		private var myStage:Stage;
		
		private var mazeList:Array;
		private var roadList:Array = new Array();
		
		private var maze:MazeGenerator = new MazeGenerator();
		
		public var animalList:Array = new Array();
		public var wallList:Array = new Array();
		public var goal:Bitmap = Assets.getTexture("Labyrintti_maali");
		
		public function Maze(mazeWidth:int, mazeHeight:int, _stage:Stage, scaleToStage:Boolean)
		{
			super();
			
			myStage = _stage;
			fitToStage = scaleToStage;
			
			mazeX = mazeWidth;
			mazeY = mazeHeight;
			
			var arr:Array = maze.generateMaze(mazeWidth, mazeHeight);
			mazeList = arr.concat();
			if(arr != null)
			for (var row:int = 0; row < arr.length; row++)
			{
				for (var col:int = 0; col < arr[0].length; col++)
				{
					// jos on tie
					if(arr[row][col])
					{
						var road:Bitmap = getTile(row, col);
						//var road:Bitmap = Assets.getTexture("Labyrintti_tie");
						if(scaleToStage)
						{
							road.scaleX = myStage.stageWidth/(mazeWidth*road.width);
							road.scaleY = myStage.stageHeight/(mazeHeight*road.height);
						}
						road.x = road.width*row;
						road.y = road.height*col;
						this.addChild(road);
						roadList.push(road);
						
						// luo vaarattomat eläimet tielle
						if(goodAnimalCounter < goodAnimalAmount)
						{
							addAnimal(row, col, true);
						}
					}
					else
					{
						// luo vaaralliset eläimet seinien paikoille
						var createdAnimal:Boolean = false;
						if(badAnimalCounter < badAnimalAmount)
						{
							createdAnimal = addAnimal(row, col, false);
						}
						if(!createdAnimal)
						{
							var wall:Bitmap = Assets.getTexture("Labyrintti_seina");
							if(scaleToStage)
							{
								wall.scaleX = myStage.stageWidth/(mazeWidth*wall.width);
								wall.scaleY = myStage.stageHeight/(mazeHeight*wall.height);
							}
							wall.x = wall.width*row;
							wall.y = wall.height*col;
							this.addChild(wall);
							wallList.push(wall);
						}
					}
				}
			}
			
			while(goodAnimalCounter < goodAnimalAmount || badAnimalCounter < badAnimalAmount)
			{
				increaseAnimals();
			}
			
			// luo maalin oikeaan alareunaan
			goal.x = this.width -(wallList[0].width*2);
			goal.y = this.height -(wallList[0].height*2);
			this.addChild(goal);
			
			for(var a:int = 0 ; a < animalList.length; a++)
				if(!animalList[a].isGood)
					updateTilesAround(animalList[a].x / roadList[0].width, animalList[a].y / roadList[0].height);
		}
		
		private function increaseAnimals():void
		{
			var blockWidth:Number = roadList[0].width;
			var blockHeight:Number = roadList[0].height;
			
			for(var i:int = 0; i < roadList.length; i++)
			{
				if(goodAnimalCounter < goodAnimalAmount)
				{
					var reserved:Boolean = false;
					
					for(var b:int = 0; b < animalList.length; b++)
						if(roadList[i].x == animalList[b].x && roadList[i].y == animalList[b].y)
						{
							reserved = true;
						}
					
					if(!reserved)
					{
						addAnimal(roadList[i].x /blockWidth, roadList[i].y /blockHeight, true);
					}
				}
			}
			
			for(i = 0; i < wallList.length; i++)
			{
				if(badAnimalCounter < badAnimalAmount)
				{
					var reserved2:Boolean = false;
					
					for(var c:int = 0; c < animalList.length; c++)
						if(wallList[i].x == animalList[c].x && wallList[i].y == animalList[c].y)
						{
							reserved2 = true;
						}
					
					if(!reserved2)
					{
						if(addAnimal(wallList[i].x /blockWidth, wallList[i].y /blockHeight, false))
						{
							this.removeChild(wallList[i]);
							wallList.splice(i, 1);
						}
					}
				}
			}
		}
		
		private function addAnimal(_x:int, _y:int, isGood:Boolean):Boolean
		{
			var createdAnimal:Boolean = false;
			var road:Bitmap = getTile(_x, _y);
			
			if(checkContiunity(_x, _y, isGood))
			{
				if(isGood)
				{
					if(Math.random() < 0.06)
					{
						var goodAnim:Animal = new Animal(true);
						
						if(fitToStage)
						{
							road.scaleX = myStage.stageWidth/(mazeX*road.width);
							road.scaleY = myStage.stageHeight/(mazeY*road.height);
							
							goodAnim.scaleX = road.scaleX;
							goodAnim.scaleY = road.scaleY;
						}
						
						createdAnimal = true;
						goodAnimalCounter++;
						
						goodAnim.x = road.width*_x;
						goodAnim.y = road.height*_y;
						this.addChild(goodAnim);
						animalList.push(goodAnim);
					}
				}
				else
				{
					if(Math.random() < 0.06)
					{
						var badAnim:Animal = new Animal(false);
						
						createdAnimal = true;
						badAnimalCounter++;
						road = getTile(_x, _y);
						
						if(fitToStage)
						{
							road.scaleX = myStage.stageWidth/(mazeX*road.width);
							road.scaleY = myStage.stageHeight/(mazeY*road.height);
						}
						
						road.x = road.width*_x;
						road.y = road.height*_y;
						this.addChild(road);
						roadList.push(road);
						
						mazeList[_x][_y] = true;
						
						badAnim = new Animal(false)
						badAnim.x = road.width*_x;
						badAnim.y = road.height*_y;
						
						badAnim.scaleX = road.scaleX;
						badAnim.scaleY = road.scaleY;
						
						this.addChild(badAnim);
						animalList.push(badAnim);
					}
				}
			}
			
			return createdAnimal;
		}
		
		private function checkContiunity(_x:int, _y:int, isGood:Boolean):Boolean
		{
			var isPossible:Boolean = false;
			var temp:Array = mazeList.concat();
			if(!isGood)
				for(var i:int = 0; i < mazeX; i++)
					for(var b:int = 0; b < mazeY; b++)
						temp[i][b] = !temp[i][b];
			
			
			if(_x == 0 && _y == 0 || _x == mazeX-1 && _y == 0 || _x == 0 && _y == mazeY-1 || _x == mazeX-1 && _y == mazeY-1)
			{
				isPossible = false;
			}
			else if(_x == 0 || _x == mazeX-1)
			{
				// vasen reuna
				if(_x == 0)
				{
					// tarkastaa muualta paitsi vasemmalta
					if(!temp[_x][_y-1] && !temp[_x][_y+1] && temp[_x+1][_y])
					{
						isPossible = true;
					}
				}
					// oikea reuna
				else
				{
					// tarkastaa muualta paitsi oikealta
					if(!temp[_x][_y-1] && !temp[_x][_y+1] && temp[_x-1][_y])
					{
						isPossible = true;
					}
				}
			}
			else if(_y == 0 || _y == mazeY-1)
			{
				// yläreuna
				if(_y == 0)
				{
					// tarkastaa muualta paitsi ylhäältä
					if(temp[_x][_y+1] && !temp[_x+1][_y] && !temp[_x-1][_y])
					{
						isPossible = true;
					}
				}
					// alareuna
				else
				{
					// tarkastaa muualta paitsi alhaalta
					if(temp[_x][_y-1] && !temp[_x+1][_y] && !temp[_x-1][_y])
					{
						isPossible = true;
					}
				}
			}
				// ei ole reunassa
			else
			{
				// tarkastaa joka suunnan
				if(!temp[_x][_y-1] && !temp[_x][_y+1] && temp[_x+1][_y] && temp[_x-1][_y] || !temp[_x+1][_y] && !temp[_x-1][_y] && temp[_x][_y-1] && temp[_x][_y+1])
				{
					isPossible = true;
				}
			}
			
			if(!isGood)
				for(var a:int = 0; a < mazeX; a++)
					for(var c:int = 0; c < mazeY; c++)
						temp[a][c] = !temp[a][c];
			
			return isPossible;
		}
		
		private function getTile(_x:int, _y:int):Bitmap
		{
			switch(getDir(_x, _y))
			{
				case "NESW":
					return Assets.getTexture("Labyrintti_tieNESW");
					break;
				case "ESW":
					return Assets.getTexture("Labyrintti_tieESW");
					break;
				case "SW":
					return Assets.getTexture("Labyrintti_tieSW");
					break;
				case "W":
					return Assets.getTexture("Labyrintti_tieW");
					break;
				case "NSW":
					return Assets.getTexture("Labyrintti_tieNSW");
					break;
				case "NEW":
					return Assets.getTexture("Labyrintti_tieNEW");
					break;
				case "NES":
					return Assets.getTexture("Labyrintti_tieNES");
					break;
				case "NW":
					return Assets.getTexture("Labyrintti_tieNW");
					break;
				case "NS":
					return Assets.getTexture("Labyrintti_tieNS");
					break;
				case "NE":
					return Assets.getTexture("Labyrintti_tieNE");
					break;
				case "EW":
					return Assets.getTexture("Labyrintti_tieEW");
					break;
				case "ES":
					return Assets.getTexture("Labyrintti_tieES");
					break;
				case "E":
					return Assets.getTexture("Labyrintti_tieE");
					break;
				case "S":
					return Assets.getTexture("Labyrintti_tieS");
					break;
				case "N":
					return Assets.getTexture("Labyrintti_tieN");
					break;

				default:
					return Assets.getTexture("Labyrintti_tie");
					break;
			}
		}
		
		private function getDir(_x:int, _y:int):String
		{
			var dir:String = "";
			
			if(_y-1 >= 0)
			{
				if(mazeList[_x][_y-1])
					dir += "N";
			}
			if(_x+1 < mazeX)
			{
				if(mazeList[_x+1][_y])
					dir += "E";
			}
			if(_y+1 < mazeY)
			{
				if(mazeList[_x][_y+1])
					dir += "S";
			}
			if(_x-1 >= 0)
			{
				if(mazeList[_x-1][_y])
					dir += "W";
			}
			
			return dir;
		}
		
		private function updateTilesAround(_x:int, _y:int):void
		{
			var blockWidth:Number = roadList[0].width;
			var blockHeight:Number = roadList[0].height;
			
			var posX:Number = _x * blockWidth;
			var posY:Number = _y * blockHeight;
			
			for(var i:int = 0; i < roadList.length; i++)
			{
				if(Math.ceil(roadList[i].x) == Math.ceil(posX)		 &&		 Math.ceil(roadList[i].y) == Math.ceil(posY - blockHeight))
				{
					roadList[i].bitmapData = getTile(roadList[i].x / blockWidth, roadList[i].y / blockHeight).bitmapData;
				}
				if(Math.ceil(roadList[i].x) == Math.ceil(posX + blockWidth)		 &&		 Math.ceil(roadList[i].y) == Math.ceil(posY))
				{
					roadList[i].bitmapData = getTile(roadList[i].x / blockWidth, roadList[i].y / blockHeight).bitmapData;
				}
				if(Math.ceil(roadList[i].x) == Math.ceil(posX)		 &&		 Math.ceil(roadList[i].y) == Math.ceil(posY + blockHeight))
				{
					roadList[i].bitmapData = getTile(roadList[i].x / blockWidth, roadList[i].y / blockHeight).bitmapData;
				}
				if(Math.ceil(roadList[i].x) == Math.ceil(posX - blockWidth)		 &&		 Math.ceil(roadList[i].y) == Math.ceil(posY))
				{
					roadList[i].bitmapData = getTile(roadList[i].x / blockWidth, roadList[i].y / blockHeight).bitmapData;
				}
			}
		}
	}
}