package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite 
	{
		[Embed(source = '../lib/Parallax-scroll-example-layer-0.gif')]
		private var layer0Class:Class;
		
		[Embed(source = '../lib/Parallax-scroll-example-layer-1.gif')]
		private var layer1Class:Class;

		[Embed(source = '../lib/Parallax-scroll-example-layer-2.gif')]
		private var layer2Class:Class;

		[Embed(source = '../lib/Parallax-scroll-example-layer-3.gif')]
		private var layer3Class:Class;

		
		private var layers:Array = new Array(
			new layer0Class(),
			new layer1Class(),
			new layer2Class(),
			new layer3Class()
		);
		
		private var startPositionsX:Array = new Array(0, 0, -160, -320);
		private var startPositionsY:Array = new Array(0, 10, 20, 30);
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//show all the images
			for (var i:int = 0; i < layers.length; i++ )
			{
				addChild(layers[i]);
				//center everything on screen
				layers[i].x = startPositionsX[i];
				layers[i].y = startPositionsY[i];
			}
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		}
		
		private function mouseMove(e:MouseEvent):void
		{
			//calculate the distance from the center of the screen (which is at x = 160, y = 100)
			var moveX:int = e.localX - 160;
			var moveY:int = e.localY - 100;
			
			for (var i:int = 0; i < layers.length; i++)
			{
				layers[i].x = startPositionsX[i] - (i * moveX) / 10;
				layers[i].y = startPositionsY[i] - (i * moveY) / 10;
			}
		}
		
	}	
}