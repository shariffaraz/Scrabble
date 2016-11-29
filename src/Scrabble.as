package
{
	import citrus.core.starling.StarlingCitrusEngine;
	
	[SWF(width="960", height="640", frameRate="60", backgroundColor="#FFFFFF")]
	public class Scrabble extends StarlingCitrusEngine
	{
		public function Scrabble()
		{
			setUpStarling();
			state = new GameState();
		}
	}
}