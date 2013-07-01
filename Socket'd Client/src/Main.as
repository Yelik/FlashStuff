package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
	import flash.ui.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Yelik
	 */
	public class Main extends Sprite
	{
		private var sock:Socket, hostname:String, port:uint, ip:String, commands:Dictionary, loader:URLLoader, msgArea:TextField, txtInput:TextField;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			hostname = "70.83.249.63";
			port = 7000;
			
			msgArea = new TextField();
			addChild(msgArea);
			msgArea.x = 0;
			msgArea.y = 0;
			msgArea.width = stage.stageWidth;
			msgArea.height = stage.stageHeight;
			
			txtInput = new TextField();
			txtInput.addEventListener(KeyboardEvent.KEY_DOWN, input);
			
			sock = new Socket();
			sock.addEventListener(Event.CONNECT, onConnect);
			sock.addEventListener(Event.CLOSE, onClose);
			
			sock.addEventListener(IOErrorEvent.IO_ERROR, onError);
			sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecError);
			
			sock.addEventListener(ProgressEvent.SOCKET_DATA, take);
			
			commands = new Dictionary();
			
			loader = new URLLoader(new URLRequest('http://mrizen.com/phpz/ip.php'));
			loader.addEventListener(Event.COMPLETE, ipGet);
		}
		
		private function input(e:KeyboardEvent):void
		{
			if (e.charCode == Keyboard.ENTER)
			{
				msgArea.appendText(txtInput.text + '\n');
				msgArea.scrollV = msgArea.maxScrollV;
				sock.writeUTF(txtInput.text);
				trace('sent: ' + txtInput.text);
				sock.flush();
				txtInput.text = "";
				
			}
		}
		
		private function onConnect(e:Event):void
		{
			msgArea.appendText('Connected to server. \n');
			msgArea.scrollV = msgArea.maxScrollV;
			var sendTable:String = '{"ip":"' + ip + '"}';
			trace(sendTable);
			sock.writeUTF(sendTable);
			sock.flush();
		}
		
		private function onClose(e:Event):void
		{
			sock.close();
			trace("socket got closed" + e);
			msgArea.appendText("\nThe connection was closed.");
			msgArea.scrollV = msgArea.maxScrollV;
		}
		
		private function onError(e:IOErrorEvent):void
		{
			trace("IO Error: " + e);
			msgArea.appendText("\nThe server isn't turned on.");
			msgArea.scrollV = msgArea.maxScrollV;
		}
		
		private function onSecError(e:SecurityErrorEvent):void
		{
			trace("Security Error" + e);
			msgArea.appendText("The policy server isn't turned on.");
			msgArea.scrollV = msgArea.maxScrollV;
		}
		
		private function take(e:ProgressEvent):void
		{
			var fromServer:String = sock.readUTFBytes(sock.bytesAvailable);
			trace('Server said: ' + fromServer.split('\n').join('\\n'));
			if (fromServer != '')
			{
				msgArea.appendText(fromServer);
				msgArea.scrollV = msgArea.maxScrollV;
			}
		}
		
		private function ipGet(e:Event):void
		{
			ip = loader.data.split('\r')[0];
			trace("Ip is " + ip);
			sock.connect(hostname, port);
		}
	}
}