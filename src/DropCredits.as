package 
{
	import org.flixel.*;
	public class DropCredits extends FlxState 
	{
		private var namesText:FlxText;
		private var returnText:FlxText;
		private var informationText:FlxText;
		
		public function DropCredits()
		{
			namesText = new FlxText(60, 60, 350);
			namesText.size = 20;
			namesText.alignment = "center";
			namesText.text = "Atil Kockar\nBurcu Aycan\nOzan Celik\nUmut Demirel\n\n";
			add(namesText);
			
			informationText = new FlxText(60, 250, 350);
			informationText.size = 15;
			informationText.alignment = "center";
			informationText.text = "Developed in Global Game Jam 2012, Ankara Metutech - Atom site. In less than 48 hours!\n\n\nBy the way you just lost \"the game\".";
			add(informationText);
			
			returnText = new FlxText(80, 450, 300, "Press Escape to go back");
			returnText.alignment = "center";
			add(returnText);
		}
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.ESCAPE)
			{
				FlxG.switchState(new DropMenuState());
			}
		}
		
	}
	
}