package com.mrizen.scrollingshooter.utilities
{
	import com.mrizen.scrollingshooter.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.system.*;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class KongregateLoader
	{
		protected var paramObj:Object;
		protected var apiPath:String;
		protected var request:URLRequest;
		protected var loader:Loader;
		protected var kongregate:*;
		
		public function KongregateLoader()
		{
			paramObj = LoaderInfo(FlowControl.mainRef.loaderInfo).parameters;
			apiPath = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
			request = new URLRequest(apiPath);
			Security.allowDomain(apiPath);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(request);
			FlowControl.mainRef.addChild(loader);
		}
		
		protected function loadComplete(event:Event):void
		{
			kongregate = event.target.content;
			kongregate.services.connect();
		}
	}
}


