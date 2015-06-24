package 
{
	import org.flixel.*;
	public class DropPlayer extends FlxSprite 
	{
		private var isPlayerOne:Boolean;
		
		private var bullet:DropBullet;
		private var isMoving:Boolean;
		private var isFacingRight:int;
		
		public var jetPack:Number = 100;
		public var arrow: FlxSprite = new FlxSprite();
		public var jetEmitter: FlxEmitter;
		
		public var music:FlxSound;
		private var isMusicPaused:Boolean;
		
		public function DropPlayer(X:int,Y:int,one:Boolean)
		{	
			x = X;
			y = Y;
			isPlayerOne = one;
			if (!isPlayerOne) 
			{
				loadGraphic(Assets._spiritRunningRight, true, false, 40, 40);
				addAnimation("right", [0, 1, 2, 3, 4, 5, 6], 10, true);
				addAnimation("idleright", [6], 5, true);
			}
			else
			{
				loadGraphic(Assets._spikeRunningRight, true, false, 40, 40);
				addAnimation("right", [0, 1, 2, 3, 4, 5, 6], 10, true);
				addAnimation("idleright", [6], 5, true);
			}
			isFacingRight = 0;
			
			jetEmitter = new FlxEmitter(x, y, 7);
			jetEmitter.bounce = 0.3;
			jetEmitter.setRotation();
			jetEmitter.makeParticles(Assets._jetParticle, 10, 16, true, 0.8);
			jetEmitter.start(false, 0.3, 0.035);
			
			music = FlxG.play(Assets._footStepSound, 1, true);
			isMusicPaused = false;
			
			arrow.loadGraphic(Assets._upArrowImage);
		}
		
		override public function update():void
		{
			super.update();
			
			arrow.x = x + 3;
			arrow.y = y - 10;
			
			jetEmitter.x = x + (width / 2);
			jetEmitter.y = y + (height) + 5;
			
			jetEmitter.on = false;
			
			handleInput();

			if (!isMoving) 
			{
				music.pause();
				isMusicPaused = true;
			}
			else if (isMusicPaused) 
			{
				music.play();
				isMusicPaused = false;
			}
		}
		
		public function fire():void
		{
			
		}
		
		private function handleInput():void
		{
			velocity.x = 0;
			var press:Boolean = false;
			isMoving = false;
			if (KeyInput.leftKeyPressed(isPlayerOne))
			{
				velocity.x -= Constants.playerSpeed;
				press = true;
				if (isFacingRight != 1) 
				{
					loadGraphic(Assets.getAnimationSprite(isPlayerOne, isFacingRight), true, false, 40, 40);
					addAnimation("left", [0, 1, 2, 3, 4, 5, 6], 10, true);
					addAnimation("idleleft", [5], 5, true);
				}
				isFacingRight = 1;
				play("left");
				isMoving = true;
			}
			if (KeyInput.rightKeyPressed(isPlayerOne))
			{
				velocity.x += Constants.playerSpeed;
				press = true;
				if (isFacingRight != 0)
				{
					loadGraphic(Assets.getAnimationSprite(isPlayerOne, isFacingRight), true, false, 40, 40);
					addAnimation("right", [0, 1, 2, 3, 4, 5, 6], 10, true);
					addAnimation("idleright", [6], 5, true);					
				}
				isFacingRight = 0;
				play("right");
				isMoving = true;
			}
			if (KeyInput.upKeyPressed(isPlayerOne) && isTouching(FLOOR))
			{
				velocity.y -= Constants.playerJumpSpeed;
				press = true;
				isMoving = true;
				if (isFacingRight) play("idleright");
				else play("idleleft");
			}
			if (KeyInput.downKeyPressed(isPlayerOne) && jetPack > 0)
			{
				velocity.y += Constants.jetpackAcceleration;
				jetPack = jetPack - 0.5;
				play("fire");
				trace(jetPack);
				if (isFacingRight) play("idleright");
				else play("idleleft");
				jetEmitter.setYSpeed(50);
				jetEmitter.on = true;
			}
			if (!isTouching(FLOOR))
			{
				velocity.y += Constants.gravity;
			}
			if (!isMoving && isFacingRight)
			{
				play("idleright");
			}
			if (!isMoving && !isFacingRight)
			{
				play("idleleft");
			}
		}
		
	}
	
}