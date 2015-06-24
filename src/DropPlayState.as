package 
{
	import flash.display.BitmapData;
	import org.flixel.*;
	public class DropPlayState extends FlxState
	{
		private var background:FlxSprite;
		
		private var _player1:DropPlayer;
		private var _player2:DropPlayer;
		
		private var _map:FlxTilemap;
		
		private var shootTimer:FlxTimer;
		private var timeText:FlxText;
		
		private var secondsToShoot:int;
		
		private var bullet1:DropBullet;
		private var bullet2:DropBullet;
		
		private var shootDirection1:Direction;
		private var shootDirection2:Direction;
		
		private var lastBulletCollisionPointX:int;
		private var lastBulletCollisionPointY:int;
		
		private var mapIndex:int;
		private var tilemap:Class;
		
		private var ceiling:FlxSprite;
		private var rightBlock:FlxSprite;
		private var leftBlock:FlxSprite;
		
		private var fuelRect1: FlxSprite = new FlxSprite(100, 10);
		private var fuelRect1Back: FlxSprite = new FlxSprite(100, 10);
		
		private var fuelRect2: FlxSprite = new FlxSprite(300, 10);
		private var fuelRect2Back: FlxSprite = new FlxSprite(300, 10);
		
		override public function create():void
		{
			super.create();
			
			background = new FlxSprite(0, 0, Assets._backgroundImage);
			add(background);
			
			initMap();
			initPlayers();
			initShootTimer();
			initFuels();
			initJet();
			
			rightBlock = new FlxSprite(-20, 0);
			rightBlock.height = 500;
			rightBlock.immovable = true;
			add(rightBlock);
			leftBlock = new FlxSprite(500, 0);
			leftBlock.height = 500;
			leftBlock.immovable = true;
			add(leftBlock);
			ceiling = new FlxSprite(0, 0);
			ceiling.width = 500;
			ceiling.immovable = true;
			add(ceiling);

		}
		
		override public function update():void
		{
			super.update();
			updateFuelDisplays();
			checkMapCollisions();
			checkBulletCollisions();
			checkWinConditions();
		}
		
		private function initFuels(): void
		{
			fuelRect1.height = 100;
			fuelRect1Back.height = 100;
			fuelRect2.height = 100;
			fuelRect2Back.height = 100;
			fuelRect1.width = 15;
			fuelRect1Back.width = 15;
			fuelRect2.width = 15;
			fuelRect2Back.width = 15;
			fuelRect1Back.loadGraphic(Assets._redBarImage);
			fuelRect2Back.loadGraphic(Assets._redBarImage);
			fuelRect1.loadGraphic(Assets._greenBarImage);
			fuelRect2.loadGraphic(Assets._greenBarImage);
			add(fuelRect1Back);
			add(fuelRect2Back);
			add(fuelRect1);
			add(fuelRect2);
		}
		
		private function initJet(): void
		{
			add(_player1.jetEmitter);
			add(_player2.jetEmitter);
		}
		
		private function updateShootDirectionIcons():void
		{
			_player1.arrow.angle = shootDirection1.getRotationAngles();
			_player2.arrow.angle = shootDirection2.getRotationAngles();
		}
		
		private function initPlayers():void
		{
			shootDirection1 = Direction.getRandomDirection();
			shootDirection2 = Direction.getRandomDirection();
			updateShootDirectionIcons();
			add(_player1.arrow);
			add(_player2.arrow);

		}
		private function initMap():void
		{
			mapIndex = Math.random() * 5;
			_map = new FlxTilemap();
			if (mapIndex == 0) 
			{
				_map.loadMap(FlxTilemap.imageToCSV(Assets._map1, false, 1) , Assets._tileImage, 10, 10, FlxTilemap.OFF);
				tilemap = Assets._map1;
			}
			if (mapIndex == 1) 
			{
				tilemap = Assets._map2;
				_map.loadMap(FlxTilemap.imageToCSV(Assets._map2, false, 1) , Assets._tileImage, 10, 10, FlxTilemap.OFF);
			}
			if (mapIndex == 2) 
			{
				tilemap = Assets._map3;
				_map.loadMap(FlxTilemap.imageToCSV(Assets._map3, false, 1) , Assets._tileImage, 10, 10, FlxTilemap.OFF);
			}
			if (mapIndex == 3)
			{
				tilemap = Assets._map4;
				_map.loadMap(FlxTilemap.imageToCSV(Assets._map4, false, 1) , Assets._tileImage, 10, 10, FlxTilemap.OFF);				
			}
			if (mapIndex == 4)
			{
				tilemap = Assets._map5;
				_map.loadMap(FlxTilemap.imageToCSV(Assets._map5, false, 1) , Assets._tileImage, 10, 10, FlxTilemap.OFF);				
			}			
			add(_map);
			var currentLevelBitmap:BitmapData;
			currentLevelBitmap = new tilemap().bitmapData;	
			for (var i:int = 0; i < currentLevelBitmap.width; i++)
			{
				for (var j:int = 0; j < currentLevelBitmap.height; j++)
				{
					switch(currentLevelBitmap.getPixel(i, j))
					{
						case Constants.player1SpawnColorCode:
							_player1 = new DropPlayer(i * 10, j * 10, true);
							add(_player1);
						break;
						case Constants.player2SpawnColorCode:
							_player2 = new DropPlayer(i * 10, j * 10, false);
							add(_player2);
						break;
					}
				}
			}
		}
		
		private function initShootTimer():void
		{
			shootTimer = new FlxTimer();
			shootTimer.start(0.5, 500, onShootTimerTick);
			timeText = new FlxText(200, 15, 100);
			timeText.alignment = "center";
			timeText.text = "5";
			secondsToShoot = 5;
			timeText.size = 20;
			add(timeText);
		}
		
		private function onShootTimerTick(t:FlxTimer):void
		{
			secondsToShoot--;
			if (secondsToShoot == 0)
			{
				timeText.text = "FIRE!";
				bullet1 = new DropBullet(shootDirection1, _player1.x, _player1.y);
				add(bullet1);
				bullet2 = new DropBullet(shootDirection2, _player2.x, _player2.y);
				add(bullet2);
				secondsToShoot = 5;
				shootDirection1 = Direction.getRandomDirection();
				shootDirection2 = Direction.getRandomDirection();
				updateShootDirectionIcons();
				FlxG.play(Assets._gunshotSound, 1, false);
			}
			else
			{
				timeText.text = "" + secondsToShoot;
			}
		}
		private function DEBUG():void
		{
			var i:int, j:int;
			for (i = 0; i < 500; i++)
			{
				for (j = 0; j < 500; j++)
				{
					trace(_map.getTile(i, j));
				}
				trace("\n");
			}
		}
		private function checkBulletCollisions():void
		{
			if (bullet1 && _map.getTile(bullet1.x/10, bullet1.y/10) != 0)
			{
				remove(bullet1);
				lastBulletCollisionPointX = bullet1.x / 10;
				lastBulletCollisionPointY = bullet1.y / 10;
				bullet1.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
			if (bullet1 && _map.getTile((bullet1.x+bullet1.width)/10, bullet1.y/10) != 0)
			{
				remove(bullet1);
				lastBulletCollisionPointX = (bullet1.x+bullet1.width) / 10;
				lastBulletCollisionPointY = bullet1.y / 10;
				bullet1.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
			if (bullet1 && _map.getTile(bullet1.x/10,   (bullet1.y + bullet1.height)/10) != 0)
			{
				remove(bullet1);
				lastBulletCollisionPointX = bullet1.x / 10;
				lastBulletCollisionPointY = (bullet1.y + bullet1.height) / 10;
				bullet1.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
			if (bullet2 && _map.getTile(bullet2.x/10, bullet2.y/10) != 0)
			{
				remove(bullet2);
				lastBulletCollisionPointX = bullet2.x / 10;
				lastBulletCollisionPointY = bullet2.y / 10;
				bullet2.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
			if (bullet2 && _map.getTile((bullet2.x+bullet2.width)/10, bullet2.y/10) != 0)
			{
				remove(bullet2);
				lastBulletCollisionPointX = (bullet2.x+bullet2.width) / 10;
				lastBulletCollisionPointY = bullet2.y / 10;
				bullet2.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
			if (bullet2 && _map.getTile(bullet2.x/10, (bullet2.y + bullet2.height)/10) != 0)
			{
				remove(bullet2);
				lastBulletCollisionPointX = bullet2.x / 10;
				lastBulletCollisionPointY = (bullet2.y + bullet2.height) / 10;
				bullet2.x = 100000;
				removeTiles(lastBulletCollisionPointX, lastBulletCollisionPointY);
			}
		}
		private function checkWinConditions():void
		{
			if (_player1.y > Constants.deathHeight) FlxG.switchState(new DropWin(2));
			if (_player2.y > Constants.deathHeight) FlxG.switchState(new DropWin(1));
			
		}
		private function removeTiles(X:int,Y:int):void
		{
			if (X > 50 || X < 0 || Y > 50 || Y < 0) return;
			if (_map.getTile(X, Y) == 0) return;
			_map.setTile(X, Y, 0,true);
			removeTiles(X + 1, Y);
			removeTiles(X - 1, Y);
			removeTiles(X, Y + 1);
			removeTiles(X, Y - 1);
		}
		
		private function checkMapCollisions():void 
		{
			FlxG.collide(_player1, _map);
			FlxG.collide(_player2, _map);
			FlxG.collide(_player1, ceiling);
			FlxG.collide(_player2, ceiling);
			FlxG.collide(_player1, leftBlock);
			FlxG.collide(_player2, leftBlock);
			FlxG.collide(_player1, rightBlock);
			FlxG.collide(_player2, rightBlock);
		}
		
		private function updateFuelDisplays():void 
		{
			fuelRect1.scale.x = _player1.jetPack / 100;
			fuelRect2.scale.x = _player2.jetPack / 100;
		}
	}
	
}