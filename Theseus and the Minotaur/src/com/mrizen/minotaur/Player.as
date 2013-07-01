package com.mrizen.minotaur 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author yelik
	 */
	public class Player extends Unit 
	{
		private var keyDown:Boolean;
		private var keyUp:Boolean;
		private var keyLeft:Boolean;
		private var keyRight:Boolean;
		private var keySpace:Boolean;
		
		public function Player(currentTile:Tile, index:uint) 
		{
			super(currentTile, index);
		}
		
		override protected function basePrep():void 
		{
			FlowControl.main.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			image = new MediaLoader.Character();
			smell = 2;
			strength = 1;
		}
		
		override protected function myTurn(e:Event):void 
		{
			if (keyDown) {
				if (currentTile.getNeighbor("down").getWalkable()) {
					keyDown = false;
					targetTile = currentTile.getNeighbor("down");
					move(true);
					turnOver = true;
				}
			}else if (keyLeft) {
				if (currentTile.getNeighbor("left").getWalkable()) {
					keyLeft = false;
					targetTile = currentTile.getNeighbor("left");
					move(true);
					turnOver = true;
				}
			}else if (keyUp) {
				if (currentTile.getNeighbor("up").getWalkable()) {
					keyUp = false;
					targetTile = currentTile.getNeighbor("up");
					move(true);
					turnOver = true;
				}
			}else if (keyRight) {
				if (currentTile.getNeighbor("right").getWalkable()) {
					keyRight = false;
					targetTile = currentTile.getNeighbor("right");
					move(true);
					turnOver = true;
				}
			}else if (keySpace) {
				keySpace = false;
				turnOver = true;
			}
			
			if (currentTile.getType() == Tile.typeEnd) {
				removeEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
				FlowControl.levelComplete(currentTile.getLevelNumber());
			}
			
			if (localToGlobal(currentTile.getPoint()).x <= currentTile.getImageSize() * 4) {
				FlowControl.mapLoader.x += currentTile.getImageSize() / 10;
			}
			if (localToGlobal(currentTile.getPoint()).x >= (currentTile.getImageSize() * 10) - (currentTile.getImageSize() * 4)) {
				FlowControl.mapLoader.x -= currentTile.getImageSize() / 10;
			}
			if (localToGlobal(currentTile.getPoint()).y <= currentTile.getImageSize() * 4) {
				FlowControl.mapLoader.y += currentTile.getImageSize() / 10;
			}
			if (localToGlobal(currentTile.getPoint()).y >= (currentTile.getImageSize() * 10) - (currentTile.getImageSize() * 4)) {
				FlowControl.mapLoader.y -= currentTile.getImageSize() / 10;
			}
			
			super.myTurn(e);
		}
		
		override public function die():void 
		{
			removeEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			super.die();
		}
		
		protected function keyDownListener(e:KeyboardEvent):void
		{
			keyDown = false;
			keyRight = false;
			keyLeft = false;
			keyUp = false;
			if (e.keyCode == Keyboard.LEFT) {
				keyLeft = true;
			}else if (e.keyCode == Keyboard.UP) {
				keyUp = true;
			}else if (e.keyCode == Keyboard.RIGHT) {
				keyRight = true;
			}else if (e.keyCode == Keyboard.DOWN) {
				keyDown = true;
			}else if (e.keyCode == Keyboard.SPACE) {
				keySpace = true;
			}
		}
	}
}