package
{
	import citrus.core.starling.StarlingCitrusEngine;
	
	[SWF(width="960", height="640", frameRate="60", backgroundColor="#FFFFFF")]
	public class Citrus extends StarlingCitrusEngine
	{
		public function Citrus()
		{
			setUpStarling();
			state = new GameState();
		}
	}
}