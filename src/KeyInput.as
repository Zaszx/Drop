package  
{
	import org.flixel.*;
	public final class KeyInput 
	{
		public static function leftKeyPressed(isPlayerOne:Boolean)
		{
			if (isPlayerOne)
			{
				return FlxG.keys.A;
			}
			else
			{
				return FlxG.keys.LEFT;
			}
		}
		
		public static function rightKeyPressed(isPlayerOne:Boolean)
		{
			if (isPlayerOne)
			{
				return FlxG.keys.D;
			}
			else
			{
				return FlxG.keys.RIGHT;
			}
		}
		
		public static function upKeyPressed(isPlayerOne:Boolean)
		{
			if (isPlayerOne)
			{
				return FlxG.keys.W;
			}
			else
			{
				return FlxG.keys.UP;
			}
		}
		
		public static function downKeyPressed(isPlayerOne:Boolean)
		{
			if (isPlayerOne)
			{
				return FlxG.keys.S;
			}
			else
			{
				return FlxG.keys.DOWN;
			}
		}
	}

}