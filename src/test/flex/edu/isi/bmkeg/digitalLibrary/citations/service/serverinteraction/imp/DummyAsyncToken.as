package edu.isi.bmkeg.digitalLibrary.citations.service.serverinteraction.imp
{
	import mx.messaging.messages.IMessage;
	import mx.rpc.AsyncToken;
	
	public class DummyAsyncToken extends AsyncToken
	{
		public function DummyAsyncToken(message:IMessage=null)
		{
			super(message);
		}
		
		public var dummyResult:Object;
		
		override public function get result():Object
		{
			return dummyResult;
		}
	}
}