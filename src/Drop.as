package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.*;
	[SWF (width = "500",height = "500")]
	public class Drop extends FlxGame 
	{
		
		public function Drop()
		{
			super(500,500,DropMenuState,1,50,50,true);
			forceDebugger = true;			
		}
		
	}
	
}