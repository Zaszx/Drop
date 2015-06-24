package 
{
	import org.flixel.*;

	public class DropWin extends FlxState 
	{
		private var winnerInfoText:FlxText;
		private var infoText:FlxText;
		
		private var spikeImage:FlxSprite;
		private var spiritImage:FlxSprite;
		
		private var winnerOrLoserText1:FlxText;
		private var winnerOrLoserText2:FlxText;
		
		public function DropWin(player:int)	//0 for spirit, 1 for spike.
		{
			winnerInfoText = new FlxText(50, 50, 400);
			winnerInfoText.size = 40;
			winnerInfoText.alignment = "center";
			
			if (player == 1)
			{
				winnerInfoText.text = "SPIKE WON!";
			}
			else
			{
				winnerInfoText.text = "SPIRIT WON!";
			}
			add(winnerInfoText);
			
			infoText = new FlxText(150, 350, 200);
			infoText.size = 20;
			infoText.alignment = "center";
			infoText.text = "Press X to play again.";
			add(infoText);
			
			spikeImage = new FlxSprite(50, 200, Assets._spikeImage);
			add(spikeImage);
			spiritImage = new FlxSprite(370, 200, Assets._spiritImage);
			add(spiritImage);
			
			winnerOrLoserText1 = new FlxText(30, 170, 100);
			winnerOrLoserText2 = new FlxText(340, 170, 100);
			winnerOrLoserText1.size = 20;
			winnerOrLoserText2.size = 20;
			if (player == 1)
			{
				winnerOrLoserText1.text = "WINNER";
				winnerOrLoserText1.color = Constants.winnerColor;
				winnerOrLoserText2.color = Constants.loserColor;
				winnerOrLoserText2.text = "LOSER";
			}
			else
			{
				winnerOrLoserText2.text = "WINNER";
				winnerOrLoserText2.color = Constants.winnerColor;
				winnerOrLoserText1.color = Constants.loserColor;
				winnerOrLoserText1.text = "LOSER";				
			}
			add(winnerOrLoserText1);
			add(winnerOrLoserText2);
		}
		override public function update():void
		{
			if (FlxG.keys.X)
			{
				FlxG.switchState(new DropPlayState());
			}
		}
		
	}
	
}