package
{
	import com.shariffaraz.scrabble.Board;
	
	import citrus.core.starling.StarlingState;
	import citrus.objects.CitrusSprite;
	import citrus.physics.box2d.Box2D;
	
	public class GameState extends StarlingState
	{
		public function GameState()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			var physics:Box2D = new Box2D("physics");
			//physics.visible = true;
			add(physics);
			
			var boardSprite:CitrusSprite = new CitrusSprite("board", {view:new Board()});
			boardSprite.touchable = true;
			add(boardSprite);
		}
		
	}
}