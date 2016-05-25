package scene.game
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import scene.Main;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.TextureAtlas;

	public class Time extends Sprite
	{
		private var _atlas:TextureAtlas;
		private var _second:int;
		private var _minute:int;
		
		private var _timer:Timer;
		
		private var _10minuteImage:Image;
		private var _1minuteImage:Image;
		private var _10secondImage:Image;
		private var _1secondImage:Image;
		
		public function get timer():Timer {	return _timer; }
		public function set timer(value:Timer):void { _timer = value; }
		
		public function Time(atlas:TextureAtlas)
		{
			_atlas = atlas;
			init();
			
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
		private function init():void
		{
			_10minuteImage = new Image(_atlas.getTexture("number0"));
			_10minuteImage.width = Main.stageWidth * 0.1;
			_10minuteImage.height = Main.stageHeight * 0.1;
			_10minuteImage.x = Main.stageWidth * 0.1;
			
			_1minuteImage = new Image(_atlas.getTexture("number0"));
			_1minuteImage.width = Main.stageWidth * 0.1;
			_1minuteImage.height = Main.stageHeight * 0.1;
			_1minuteImage.x = Main.stageWidth * 0.2;
			
			_10secondImage = new Image(_atlas.getTexture("number0"));
			_10secondImage.width = Main.stageWidth * 0.1;
			_10secondImage.height = Main.stageHeight * 0.1;
			_10secondImage.x = Main.stageWidth * 0.35;
			
			_1secondImage = new Image(_atlas.getTexture("number0"));
			_1secondImage.width = Main.stageWidth * 0.1;
			_1secondImage.height = Main.stageHeight * 0.1;
			_1secondImage.x = Main.stageWidth * 0.45;
			
			addChild(_10minuteImage);
			addChild(_1minuteImage);
			addChild(_10secondImage);
			addChild(_1secondImage);
		}

		/**
		 * 매 초마다 시간을 갱신하는 콜백 메소드
		 * @param event 타이머 이벤트
		 * 
		 */
		private function onTimer(event:TimerEvent):void
		{
			//trace("[timer] " + _timer.currentCount);			
			_second = _timer.currentCount % 60;
			_minute = _timer.currentCount / 60;
			changeImage();
			//trace(_minute + " : " + _second); 
		}
		
		/**
		 * 매 초마다 갱신된 시간값을 토대로 이미지를 바꿔주는 메소드 
		 * 
		 */
		private function changeImage():void
		{
			_1secondImage.texture = _atlas.getTexture("number"+(_second % 10).toString());
			_10secondImage.texture = _atlas.getTexture("number"+(int(_second / 10)).toString());
			
			_1minuteImage.texture = _atlas.getTexture("number"+(_minute % 10).toString());
			_10minuteImage.texture = _atlas.getTexture("number"+(int(_minute / 10)).toString());
		}
	}
}