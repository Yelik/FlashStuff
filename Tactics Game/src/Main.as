package
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Insuferior
	 */
	public class Main extends Sprite
	{
		private var ready:Boolean = false;
		private var tileTypes:Vector.<Tile>;
		private var numTileTypes:int;
		private var numRegTypes:int;
		private var games:Vector.<Game>;
		private var numGames:int;
		private var regTypes:Vector.<Reg>;
		private var turn:Boolean;
		private var loadedGame:int;
		private var selectedTile:Tile;
		
		public static const TEAM1:Boolean = false;
		public static const TEAM2:Boolean = true;
		public static const TOP:int = 0;
		public static const LEFT:int = 3;
		public static const BOT:int = 2;
		public static const RIGHT:int = 1;
		static public const WIDTH:int = 4;
		static public const HEIGHT:int = 5;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addChild(new FPSCounter());
			setReady(false);
			makeTileTypes();
			makeRegTypes();
			makeGames();
			setReady(true);
			loadGame(Game.GAME_ONE);
			moveReg(getGame(Game.GAME_ONE).getAt([1, 1]).getReg(), [1, 3, Reg.DOWN]);
			stage.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void
		{
			var local:Array = getGame(getLoadedGameIndex()).getTileAtClick([e.stageX, e.stageY]);
			tileSelected(getGame(getLoadedGameIndex()).getAt([Math.floor(local[0]), Math.floor(local[1])]));
		}
		
		private function tileSelected(tile:Tile):void
		{
			if (getSelectedTile() != null)
			{
				if (getSelectedTile().getReg().getMoved() || getSelectedTile() == tile)
				{
					setSelectedTile(null);
				}
				else
				{
					moveReg(getSelectedTile().getReg(), tile.getLocal());
					setSelectedTile(tile);
				}
				return;
			}
			if (tile.getReg() != null)
			{
				setSelectedTile(tile);
			}
		}
		
		private function loadGame(game:int):void
		{
			setTurn(Math.round(Math.random()) == 0);
			switchTurn();
			getGame(game).draw();
			setLoadedGame(game);
		}
		
		private function updateGame():void
		{
			getGame(getLoadedGameIndex()).draw();
		}
		
		private function moveReg(reg:Reg, local:Array):void
		{
			reg.getTile().setReg(null);
			reg.setLocal(local);
			reg.setMoved(true);
			updateGame();
		}
		
		private function makeGames():void
		{
			setGames(new Vector.<Game>);
			for (var i:int = 0; i < numGames; i++)
			{
				games.push(null);
			}
			
			//Setup Game
			games[Game.GAME_ZERO] = new Game(this, new Vector.<Tile>, 1);
			
			//Game One
			games[Game.GAME_ONE] = makeGameSquare(Game.GAME_ONE, 12);
			setRegTypeAt(Game.GAME_ONE, [1, 1, Reg.RIGHT], Reg.PEASENTS, TEAM1);
			setRegTypeAt(Game.GAME_ONE, [2, 1, Reg.LEFT], Reg.FOOTMAN, TEAM2);
		}
		
		private function makeGame(game:int, width:int, height:int):Game
		{
			return new Game(this, genMap([width, height], game), width);
		}
		
		private function makeGameSquare(game:int, size:int):Game
		{
			return makeGame(game, size, size);
		}
		
		private function makeTileTypes():void
		{
			numTileTypes = 2;
			setTileTypes(new Vector.<Tile>);
			for (var i:int = 0; i < numTileTypes; i++)
			{
				tileTypes.push(new Tile(this, Game.GAME_ZERO, [0, 0], -1));
			}
			
			tileTypes[Tile.FLAT].setWalkable(true);
			
			tileTypes[Tile.VOID].setWalkable(false);
		}
		
		private function makeRegTypes():void
		{
			numRegTypes = 2;
			setRegTypes(new Vector.<Reg>);
			for (var i:int = 0; i < numRegTypes; i++)
			{
				regTypes.push(new Reg(this, Game.GAME_ZERO, [0, 0], -1, false));
			}
			//peasent
			regTypes[Reg.PEASENTS].setDamage(1);
			regTypes[Reg.PEASENTS].setMaxLife(2);
			
			//footman
			regTypes[Reg.FOOTMAN].setDamage(1);
			regTypes[Reg.FOOTMAN].setMaxLife(3);
		}
		
		private function genMap(mapSize:Array, game:int):Vector.<Tile>
		{
			var map:Vector.<Tile> = new Vector.<Tile>;
			
			for (var x:int = 0; x < mapSize[0]; x++)
			{
				for (var y:int = 0; y < mapSize[1]; y++)
				{
					if (x == 0 || y == 0 || x == mapSize[0] - 1 || y == mapSize[1] - 1)
					{
						map.push(new Tile(this, game, [x, y], Tile.VOID));
					}
					else
					{
						map.push(new Tile(this, game, [x, y], Tile.FLAT));
					}
				}
			}
			
			return map;
		}
		
		public function isReady():Boolean
		{
			return ready;
		}
		
		private function getSelectedTile():Tile
		{
			return selectedTile;
		}
		
		private function getLoadedGameIndex():int
		{
			return loadedGame;
		}
		
		private function getLoadedGame():Game
		{
			return getGame(getLoadedGameIndex());
		}
		
		public function getGame(index:int):Game
		{
			if (games.length > index)
				return games[index];
			return null;
		}
		
		public function getTileType(type:int):Tile
		{
			return getTileTypes()[type];
		}
		
		public function getRegType(type:int):Reg
		{
			return getRegTypes()[type];
		}
		
		public function getMapSpace(side:int):int
		{
			if (side == TOP)
			{
				return 25;
			}
			else if (side == LEFT)
			{
				return 25;
			}
			else if (side == RIGHT)
			{
				return 575;
			}
			else if (side == BOT)
			{
				return 575;
			}
			else if (side == WIDTH)
			{
				return getMapSpace(RIGHT) - getMapSpace(LEFT);
			}
			else if (side == HEIGHT)
			{
				return getMapSpace(BOT) - getMapSpace(TOP);
			}
			trace("invalid side");
			return -1;
		}
		
		private function getRegTypes():Vector.<Reg>
		{
			return regTypes;
		}
		
		private function getTileTypes():Vector.<Tile>
		{
			return tileTypes;
		}
		
		private function getTurn():Boolean
		{
			return turn;
		}
		
		private function setTurn(turn:Boolean):void
		{
			this.turn = turn;
		}
		
		private function switchTurn():void
		{
			turn = !turn;
			for (var index:int = 0; index < getGame(Game.GAME_ONE).getRegs().length; index++)
			{
				getGame(Game.GAME_ONE).getReg(index).setMoved(false);
			}
		}
		
		private function setTileTypes(value:Vector.<Tile>):void
		{
			tileTypes = value;
		}
		
		private function setGames(game:Vector.<Game>):void
		{
			this.games = game
		}
		
		private function setReady(ready:Boolean):void
		{
			this.ready = ready;
		}
		
		private function setRegTypeAt(game:int, local:Array, type:int, team:Boolean):void
		{
			games[game].getAt(local).setReg(new Reg(this, game, local, type, team));
		}
		
		private function setRegTypes(regTypes:Vector.<Reg>):void
		{
			this.regTypes = regTypes;
		}
		
		private function setSelectedTile(tile:Tile):void
		{
			this.selectedTile = tile;
		}
		
		private function setLoadedGame(game:int):void
		{
			this.loadedGame = game;
		}
	}
}
