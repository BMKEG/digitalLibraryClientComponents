package edu.isi.bmkeg.digitalLibrary.citations.service.imp
{
	import mx.rpc.AsyncResponder;
	
	/**
	 * The purpose of this class is to expose the token so it can be checked in unit tests
	 */
	public class MyAsyncResponder extends AsyncResponder
	{
		private var _token:Object;
		
		public function MyAsyncResponder(result:Function, fault:Function, token:Object=null)
		{
			super(result, fault, token);
			_token = token;
		}
		
		public function get token():Object
		{
			return _token;
		}
	}
}