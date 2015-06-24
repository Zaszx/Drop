package  
{
	public final class Direction 
	{
		public static const UP:Direction = new Direction();
		public static const LEFT:Direction = new Direction();
		public static const RIGHT:Direction = new Direction();
		public static const DOWN:Direction = new Direction();
		
		public static function getRandomDirection():Direction
		{
			var randomValue:int = Math.random() * 4;
			switch(randomValue)
			{
				case 0:
					return Direction.UP;
					break;
				case 1:
					return Direction.LEFT;
					break;
				case 2:
					return Direction.RIGHT;
					break;
				case 3:
					return Direction.DOWN;
					break;
			}
			return Direction.LEFT;
		}
		
		public function getRotationAngles():int
		{
			if (this == UP)
			{
				return 0;
			}
			else if (this == RIGHT)
			{
				return 90;
			}
			else if (this == DOWN)
			{
				return 180;
			}
			else if (this == LEFT)
			{
				return 270;
			}
			
			return 0;
		}
	}

}