package com.mrizen.simpleshooter
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author yelik
	 */
	public class KongregateLoader
	{
		private var paramObj:Object;
		private var apiPath:String;
		private var request:URLRequest;
		private var loader:Loader;
		private var kongregate:*;
		
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
		
		private function loadComplete(event:Event):void
		{
			kongregate = event.target.content;
			kongregate.services.connect();
		}
	}
}