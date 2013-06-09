package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	public class CitationsListPageFaultEvent extends Event
	{
		public static const FAULT:String = "CitationsListPageFaultEvent";

		/**
		 * selected Article or null if none is selected
		 */
		public var offset:int;
		public var count:int;
		
		public function CitationsListPageFaultEvent(offset:int, count:int,
												 bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(FAULT, bubbles, cancelable);
			this.offset = offset;
			this.count = count;
		}

		override public function clone():Event
		{
			return new CitationsListPageFaultEvent(offset, count, bubbles, cancelable)
		}

	}
}