package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class ChangeFragmentType extends Event 
	{
		
		public static const CHANGE_FRAGMENT_TYPE:String = "changeFragmentType";
		
		public var fType:String;
		
		public function ChangeFragmentType(fType:String,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.fType = fType;
			super(CHANGE_FRAGMENT_TYPE, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new ChangeFragmentType(fType, bubbles, cancelable);
		}
		
	}
	
}
