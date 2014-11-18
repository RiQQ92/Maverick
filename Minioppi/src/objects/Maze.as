package objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import utility.MazeGenerator;
	
	public class Maze extends Sprite
	{
		private var badAnimalAmount:int = 12;
		private var badAnimalCounter:int = 0;
		
		private var goodAnimalAmount:int = 12;
		private var goodAnimalCounter:int = 0;
		
		private var myStage:Stage;
		
		private var roadList:Array = new Array();
		
		private var maze:MazeGenerator = new MazeGenerator();
		
		public var animalList:Array = new Array();
		public var wallList:Array = new Array();
		public var goal:Bitmap = Assets.getTexture("Labyrintti_maali");
		
		public function Maze(mazeWidth:int, mazeHeight:int, _stage:Stage, scaleToStage:Boolean)
		{
			super();
			
			myStage = _stage;
			
			var arr:Array = maze.generateMaze(mazeWidth, mazeHeight);
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
						var road:Bitmap = Assets.getTexture("Labyrintti_tie");
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
											road2 = Assets.getTexture("Labyrintti_tie");
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
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
											road2 = Assets.getTexture("Labyrintti_tie");
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
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
											road2 = Assets.getTexture("Labyrintti_tie");
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
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
											road2 = Assets.getTexture("Labyrintti_tie");
											if(scaleToStage)
											{
												road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
												road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
											}
											road2.x = road2.width*row;
											road2.y = road2.height*col;
											this.addChild(road2);
											roadList.push(road2);
											
											badAnim = new Animal(false)
											badAnim.x = road2.width*row;
											badAnim.y = road2.height*col;
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
										road2 = Assets.getTexture("Labyrintti_tie");
										if(scaleToStage)
										{
											road2.scaleX = myStage.stageWidth/(mazeWidth*road2.width);
											road2.scaleY = myStage.stageHeight/(mazeHeight*road2.height);
										}
										road2.x = road2.width*row;
										road2.y = road2.height*col;
										this.addChild(road2);
										roadList.push(road2);
										
										badAnim = new Animal(false)
										badAnim.x = road2.width*row;
										badAnim.y = road2.height*col;
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
		}
	}
}