package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveFragmentTreeEvent extends Event 
	{
		
		public static const RETRIEVE_FRAGMENT_TREE:String = 
			"retrieveFragmentTree";
				
		public function RetrieveFragmentTreeEvent()
		{
			super(RETRIEVE_FRAGMENT_TREE);
		}
		
		override public function clone() : Event
		{
			return new RetrieveFragmentTreeEvent();
		}
		
	}
	
}
