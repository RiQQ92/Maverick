package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import utility.DebugText;
	import utility.MazeGenerator;
	
	public class Maze extends Sprite
	{
		private var badAnimalAmount:int = 12;
		private var badAnimalCounter:int = 0;
		
		private var goodAnimalAmount:int = 12;
		private var goodAnimalCounter:int = 0;
		
		private var mazeX:int = 0;
		private var mazeY:int = 0;
		
		private var debug:DebugText;
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
			
			debug = new DebugText("", myStage);
			this.addChild(debug);
			debug.replace("tulostanpa: ");
			
			mazeX = mazeWidth;
			mazeY = mazeHeight;
			
			var arr:Array = maze.generateMaze(mazeWidth, mazeHeight);
			mazeList = arr.concat();
			if(arr != null)
			for (var row:int = 0; row < arr.length; row++)
			{
				for (var col:int = 0; col < arr[0].length; col++)
				{
					var badAnim:Animal = new Animal(false);
					var goodAnim:Animal = new Animal(true);
					var road2:Bitmap;
					
					// jos on tie
					if(arr[row][col])
					{
						var road:Bitmap = getTile(row, col);
						//var road:Bitmap = Assets.getTexture("Labyrintti_tie");
						if(scaleToStage)
						{
							road.scaleX = myStage.stageWidth/(mazeWidth*road.width);
							road.scaleY = myStage.stageHeight/(mazeHeight*road.height);
							
							goodAnim.scaleX = road.scaleX;
							goodAnim.scaleY = road.scaleY;
						}
						road.x = road.width*row;
						road.y = road.height*col;
						this.addChild(road);
						roadList.push(road);
						
						// luo vaarattomat eläimet tielle
						if(goodAnimalCounter < goodAnimalAmount)
						{
							if(row == 0 || row == mazeWidth-1)
							{
								// vasen reuna
								if(row == 0)
								{
									// tarkastaa muualta paitsi vasemmalta
									if(!arr[row][col-1] && !arr[row][col+1] && arr[row+1][col]|| !arr[row][col+1] && arr[row][col-1] && arr[row+1][col])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											goodAnimalCounter++;
											
											goodAnim.x = road.width*row;
											goodAnim.y = road.height*col;
											this.addChild(goodAnim);
											animalList.push(goodAnim);
										}
									}
								}
								// oikea reuna
								else
								{
									// tarkastaa muualta paitsi oikealta
									if(!arr[row][col-1] && !arr[row][col+1] && arr[row-1][col] || !arr[row][col+1] && !arr[row-1][col] && arr[row][col-1])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											goodAnimalCounter++;
											
											goodAnim.x = road.width*row;
											goodAnim.y = road.height*col;
											this.addChild(goodAnim);
											animalList.push(goodAnim);
										}
									}
								}
							}
							else if(col == 0 || col == mazeHeight-1)
							{
								// yläreuna
								if(col == 0)
								{
									// tarkastaa muualta paitsi ylhäältä
									if(arr[row][col+1] && !arr[row+1][col] && !arr[row-1][col] || arr[row][col+1] && arr[row-1][col] && !arr[row+1][col])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											goodAnimalCounter++;
											
											goodAnim.x = road.width*row;
											goodAnim.y = road.height*col;
											this.addChild(goodAnim);
											animalList.push(goodAnim);
										}
									}
								}
								// alareuna
								else
								{
									// tarkastaa muualta paitsi alhaalta
									if(!arr[row][col-1] && arr[row+1][col] && arr[row-1][col] || !arr[row+1][col] && !arr[row-1][col] && arr[row][col-1])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											goodAnimalCounter++;
											
											goodAnim.x = road.width*row;
											goodAnim.y = road.height*col;
											this.addChild(goodAnim);
											animalList.push(goodAnim);
										}
									}
								}
							}
							// ei ole reunassa
							else
							{
								// tarkastaa joka suunnan
								if(!arr[row][col-1] && !arr[row][col+1] && arr[row+1][col] && arr[row-1][col] || arr[row+1][col] && !arr[row-1][col] && arr[row][col-1] && arr[row][col+1])
								{
									if(Math.random() < 0.06)
									{
										createdAnimal = true;
										goodAnimalCounter++;
										
										goodAnim.x = road.width*row;
										goodAnim.y = road.height*col;
										this.addChild(goodAnim);
										animalList.push(goodAnim);
									}
								}
							}
						}
					}
					else
					{
						// luo vaaralliset eläimet seinien paikoille
						var createdAnimal:Boolean = false;
						if(badAnimalCounter < badAnimalAmount)
						{
							if(row == 0 || row == mazeWidth-1)
							{
								if(row == 0)
								{
									if(arr[row][col-1] && arr[row][col+1] && !arr[row+1][col]|| arr[row][col+1] && !arr[row][col-1] && !arr[row+1][col])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											badAnimalCounter++;
											road2 = getTile(row, col);
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											mazeList[row][col] = true;
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
											
											badAnim.scaleX = road2.scaleX;
											badAnim.scaleY = road2.scaleY;
											
											this.addChild(badAnim);
											animalList.push(badAnim);
										}
									}
								}
								else
								{
									if(arr[row][col-1] && arr[row][col+1] && !arr[row-1][col] || arr[row][col+1] && arr[row-1][col] && !arr[row][col-1])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											badAnimalCounter++;
											road2 = getTile(row, col);
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											mazeList[row][col] = true;
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
											
											badAnim.scaleX = road2.scaleX;
											badAnim.scaleY = road2.scaleY;
											
											this.addChild(badAnim);
											animalList.push(badAnim);
										}
									}
								}
							}
							else if(col == 0 || col == mazeHeight-1)
							{
								if(col == 0)
								{
									if(arr[row][col+1] && !arr[row+1][col] && !arr[row-1][col] || arr[row][col+1] && arr[row-1][col] && !arr[row+1][col])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											badAnimalCounter++;
											road2 = getTile(row, col);
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											mazeList[row][col] = true;
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
											
											badAnim.scaleX = road2.scaleX;
											badAnim.scaleY = road2.scaleY;
											
											this.addChild(badAnim);
											animalList.push(badAnim);
										}
									}
								}
								else
								{
									if(arr[row][col-1] && !arr[row+1][col] && !arr[row-1][col] || arr[row+1][col] && arr[row-1][col] && !arr[row][col-1])
									{
										if(Math.random() < 0.06)
										{
											createdAnimal = true;
											badAnimalCounter++;
											road2 = getTile(row, col);
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											mazeList[row][col] = true;
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
											
											badAnim.scaleX = road2.scaleX;
											badAnim.scaleY = road2.scaleY;
											
											this.addChild(badAnim);
											animalList.push(badAnim);
										}
									}
								}
							}
							else
							{
								if(arr[row][col-1] && arr[row][col+1] && !arr[row+1][col] && !arr[row-1][col] || arr[row+1][col] && arr[row-1][col] && !arr[row][col-1] && !arr[row][col+1])
								{
									if(Math.random() < 0.06)
									{
										createdAnimal = true;
										badAnimalCounter++;
										road2 = getTile(row, col);
										if(scaleToStage)
										{
											road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
											road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
										}
										road2.x = road2.width*row;
										road2.y = road2.height*col;
										this.addChild(road2);
										roadList.push(road2);
										
										mazeList[row][col] = true;
										
										badAnim = new Animal(false)
										badAnim.x = road2.width*row;
										badAnim.y = road2.height*col;
										
										badAnim.scaleX = road2.scaleX;
										badAnim.scaleY = road2.scaleY;
										
										this.addChild(badAnim);
										animalList.push(badAnim);
									}
								}
							}
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
			
			// luo maalin oikeaan alareunaan
			goal.x = this.width -(wallList[0].width*2);
			goal.y = this.height -(wallList[0].height*2);
			this.addChild(goal);
			
			for(var a:int = 0 ; a < animalList.length; a++)
				if(!animalList[a].isGood)
					updateTilesAround(animalList[a].x / roadList[0].width, animalList[a].y / roadList[0].height);
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
			
			debug.replace("tulostanpa: "+ dir);
			
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