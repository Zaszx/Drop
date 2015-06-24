package 
{
	import org.flixel.*;
	public class DropBullet extends FlxSprite
	{
		public function DropBullet(direction:Direction, X:int, Y:int)
		{
			loadGraphic(Assets._bulletImage);
			if (direction == Direction.DOWN) 
			{
				angle = 180;
				velocity.y = Constants.bulletSpeed;
			}
			else if (direction == Direction.UP) 
			{
				angle = 0;
				velocity.y = -Constants.bulletSpeed;
			}
			else if (direction == Direction.RIGHT) 
			{
				angle = 90;
				velocity.x = Constants.bulletSpeed;
			}
			else if (direction == Direction.LEFT) 
			{
				angle = 270;
				velocity.x = -Constants.bulletSpeed;
			}
	
			x = X;
			y = Y;
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}
	
}