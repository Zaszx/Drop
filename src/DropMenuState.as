package 
{
	import org.flixel.*;
	
	public class DropMenuState extends FlxState 
	{
		private var title:FlxSprite;
		
		private var tutorialOption:FlxText;
		private var creditsOption:FlxText;
		private var playOption:FlxText;
		
		private var highlightedOption:int;
		
		private var tutorialScreen:DropTutorial;
		
		private var spikeImage:FlxSprite;
		private var spiritImage:FlxSprite;
		
		
		public function DropMenuState()
		{
			highlightedOption = 0;
			
			spikeImage = new FlxSprite(50, 150, Assets._spikeImage);
			add(spikeImage);
			spiritImage = new FlxSprite(350, 150, Assets._spiritImage);
			add(spiritImage);
			
			title = new FlxSprite(130, 30, Assets._titleImage);
			add(title);
			
			tutorialOption = new FlxText(200, 170, 100);
			tutorialOption.size = 20;
			tutorialOption.alignment = "center";
			tutorialOption.text = "How to Play";
			add(tutorialOption);
			
			creditsOption = new FlxText(200, 270, 100);
			creditsOption.size = 20;
			creditsOption.alignment = "center";
			creditsOption.text = "Credits";
			add(creditsOption);
			
			playOption = new FlxText(200, 370, 100);
			playOption.size = 20;
			playOption.alignment = "center";
			playOption.text = "Play";
			add(playOption);			
			
		}
		
		override public function update():void
		{
			super.update();
			if (tutorialScreen)
			{
				if (FlxG.keys.ESCAPE) 
				{
					remove(tutorialScreen);
					tutorialScreen = null;
				}
				return;
			}
			if (FlxG.keys.justPressed("UP") && highlightedOption > 0)
			{
				highlightedOption --;
			}
			
			if (FlxG.keys.justPressed("DOWN") && highlightedOption < 2)
			{
				highlightedOption ++;
			}
			
			if (highlightedOption == 0)
			{
				tutorialOption.color = Constants.highlightedMenuOptionColor;
				creditsOption.color = Constants.whiteColor;
				playOption.color = Constants.whiteColor;
			}
			
			if (highlightedOption == 1)
			{
				tutorialOption.color = Constants.whiteColor;
				creditsOption.color = Constants.highlightedMenuOptionColor;
				playOption.color = Constants.whiteColor;
			}
			if (highlightedOption == 2)
			{
				tutorialOption.color = Constants.whiteColor;
				creditsOption.color = Constants.whiteColor;
				playOption.color = Constants.highlightedMenuOptionColor;
			}
			
			if (FlxG.keys.ENTER)
			{
				if (highlightedOption == 0)
				{
					tutorialScreen = new DropTutorial();
					add(tutorialScreen);
				}
				else if (highlightedOption == 1)
				{
					FlxG.switchState(new DropCredits());
				}
				else if (highlightedOption == 2)
				{
					FlxG.switchState(new DropPlayState());
				}
			}
			
		}
		
	}
	
}