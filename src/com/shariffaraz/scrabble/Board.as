package com.shariffaraz.scrabble
{
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Board extends Sprite
	{
		[Embed(source="../../../../Sprites/ScrabbleTiles.png")]
		public static const Tiles:Class;
		
		[Embed(source="../../../../Sprites/ScrabbleTiles.xml", mimeType="application/octet-stream")]
		public static const TilesXML:Class;
		
		private const ET:String = "empty_square";
		private const ST:String = "start_square";
		private const DL:String = "double_letter";
		private const DW:String = "double_word";
		private const TL:String = "tripple_letter";
		private const TW:String = "triple_word";
		
		private var boardLayout:Array =   [[TW, ET, ET, DL, ET, ET, ET, TW, ET, ET, ET, DL, ET, ET, TW],
										   [ET, DW, ET, ET, ET, TL, ET, ET, ET, TL, ET, ET, ET, DW, ET],
										   [ET, ET, DW, ET, ET, ET, DL, ET, DL, ET, ET, ET, DW, ET, ET],
										   [DL, ET, ET, DW, ET, ET, ET, DL, ET, ET, ET, DW, ET, ET, DL],
										   [ET, ET, ET, ET, DW, ET, ET, ET, ET, ET, DW, ET, ET, ET, ET],
										   [ET, TL, ET, ET, ET, TL, ET, ET, ET, TL, ET, ET, ET, TL, ET],
										   [ET, ET, DL, ET, ET, ET, DL, ET, DL, ET, ET, ET, DL, ET, ET],
										   [TW, ET, ET, DL, ET, ET, ET, ST, ET, ET, ET, DL, ET, ET, TW],
										   [ET, ET, DL, ET, ET, ET, DL, ET, DL, ET, ET, ET, DL, ET, ET],
										   [ET, TL, ET, ET, ET, TL, ET, ET, ET, TL, ET, ET, ET, TL, ET],
										   [ET, ET, ET, ET, DW, ET, ET, ET, ET, ET, DW, ET, ET, ET, ET],
										   [DL, ET, ET, DW, ET, ET, ET, DL, ET, ET, ET, DW, ET, ET, DL],
										   [ET, ET, DW, ET, ET, ET, DL, ET, DL, ET, ET, ET, DW, ET, ET],
										   [ET, DW, ET, ET, ET, TL, ET, ET, ET, TL, ET, ET, ET, DW, ET],
										   [TW, ET, ET, DL, ET, ET, ET, TW, ET, ET, ET, DL, ET, ET, TW]];
		
		public function Board()
		{
			super();
		}
		
		public function initialize(a:*= null):void
		{
			var tilesAtlas:TextureAtlas = new TextureAtlas(Texture.fromEmbeddedAsset(Tiles), new XML(new TilesXML()));
			var tileImage:Image;
			
			for(var i:int=0; i<15; i++)
			{
				for(var j:int=0; j<15; j++)
				{
					tileImage = new Image(tilesAtlas.getTexture(boardLayout[i][j]));
					tileImage.height = Starling.current.nativeStage.stageHeight/15;
					tileImage.width = Starling.current.nativeStage.stageHeight/15;
					if(i == 0 && j==0)
					{
						tileImage.x = tileImage.y = 0;
					}
					else if(i != 0 && j==0)
					{
						tileImage.x = 0;
						tileImage.y = tileImage.height*i;
					}
					else if(i == 0 && j!=0)
					{
						tileImage.x = tileImage.width * j;
						tileImage.y = 0;
					}
					else if(i != 0 && j!=0)
					{
						tileImage.x = tileImage.width * j;
						tileImage.y = tileImage.height * i;
					}
					tileImage.addEventListener(TouchEvent.TOUCH, tileTouched);
					tileImage.name = i+"-"+j;
					addChild(tileImage);
				}
			}
		}
		
		private function tileTouched(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(e.currentTarget as DisplayObject);
			if(touch != null && touch.phase == TouchPhase.ENDED)
			{
				trace(boardLayout[Image(e.currentTarget).name.split("-")[0]][Image(e.currentTarget).name.split("-")[1]]);
			}
		}
	}
}