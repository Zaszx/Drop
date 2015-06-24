package  
{
	public class Assets 
	{
		[Embed (source = "images/spike.png")] 		public static var _spikeImage:Class;
		[Embed (source = "images/spirit.png")] 		public static var _spiritImage:Class;
		
		[Embed (source = "images/bullet.png")] 		public static var _bulletImage:Class;
		
		[Embed (source = "images/Tutorial.png")] 	public static var _tutorialImage:Class;
		[Embed (source = "images/title.png")] 		public static var _titleImage:Class;
		
		[Embed (source = "images/jet.png")] 		public static var _jetParticle:Class;
		
		[Embed (source = "sounds/footStep.mp3")] 	public static var _footStepSound:Class;
		[Embed (source = "sounds/gun.mp3")] 		public static var _gunshotSound:Class;
		
		[Embed (source = "images/map2.png")] 		public static var _map2:Class;
		[Embed (source = "images/map.png")] 		public static var _map1:Class;
		[Embed (source = "images/map3.png")] 		public static var _map3:Class;
		[Embed (source = "images/map4.png")] 		public static var _map4:Class;
		[Embed (source = "images/map5.png")] 		public static var _map5:Class;
		
		[Embed (source = "images/tiles.png")] 		public static var _tileImage:Class;
		
		[Embed (source = "images/rightArrow.png")] 	public static var _rightArrowImage:Class;
		[Embed (source = "images/leftArrow.png")] 	public static var _leftArrowImage:Class;
		[Embed (source = "images/upArrow.png")] 	public static var _upArrowImage:Class;
		[Embed (source = "images/downArrow.png")] 	public static var _downArrowImage:Class;
		[Embed (source = "images/redBar.png")] 		public static var _redBarImage:Class;
		[Embed (source = "images/greenBar.png")] 	public static var _greenBarImage:Class;
		
		[Embed (source = "images/background.png")] 	public static var _backgroundImage:Class;
		
		[Embed (source = "images/running.png")] 				public static var _spikeRunningRight:Class;
		[Embed (source = "images/reverserunning.png")] 			public static var _spikeRunningLeft:Class;
		[Embed (source = "images/spiritrunning.png")] 			public static var _spiritRunningRight:Class;
		[Embed (source = "images/spiritreverserunning.png")] 	public static var _spiritRunningLeft:Class;

		public static function getAnimationSprite(isPlayerOne:Boolean, isFacingRight:Boolean):Class
		{
			if (isPlayerOne)
			{
				if (isFacingRight)
				{
					return _spikeRunningRight;
				}
				else
				{
					return _spikeRunningLeft;
				}
			}
			else
			{
				if (isFacingRight)
				{
					return _spiritRunningRight;
				}
				else
				{
					return _spiritRunningLeft;
				}
			}
		}
		
	}

}