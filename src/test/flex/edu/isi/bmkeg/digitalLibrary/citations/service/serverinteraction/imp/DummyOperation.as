package edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	public class DummyOperation extends AbstractOperation
	{
		
		public static const EVENT_DELAY:int = 1000;
		
		public var resultEvent:ResultEvent;
		public var timer:Timer;
		public var createResultFunction:Function;
		public var callHandlerDirectly:Boolean;
				
		final public function DummyOperation(service:AbstractService=null, name:String=null,
			callHandlerDirectly:Boolean = false)
		{
			super(service, name);
			this.callHandlerDirectly = callHandlerDirectly;
			if (! callHandlerDirectly)
			{
				timer = new Timer(EVENT_DELAY, 1);
				timer.addEventListener(TimerEvent.TIMER, handleTimerEvent);						
			}

		}
	
		override public function send(... args):AsyncToken {
			var result:* = createResultFunction(args);	
			var token:DummyAsyncToken = new DummyAsyncToken();
			token.dummyResult = result;
			resultEvent = new ResultEvent(ResultEvent.RESULT,false,true,result,token);
			DummyCitationsServerImp(service).addInvokedOperation(name, args, token);
			if (callHandlerDirectly)
			{
				dispatchEvent(resultEvent);	
			}
			else
			{
				timer.start();
			}
			return token;				
		}
		
		override public function cancel(id:String=null):AsyncToken
		{
			return null;
		}
		
		private function handleTimerEvent(ev:TimerEvent):void {
			dispatchEvent(resultEvent);
			if (resultEvent.token && resultEvent.token.hasResponder())
			{
				for each (var responder:IResponder in resultEvent.token.responders)
					responder.result(resultEvent);

			}
		}

	}
}