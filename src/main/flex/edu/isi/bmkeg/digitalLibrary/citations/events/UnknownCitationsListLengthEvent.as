package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import flash.events.Event;
	
	public class UnknownCitationsListLengthEvent extends Event
	{
		public static const UNKNOWN:String = "UnknownCitationsListLengthEvent";

		public function UnknownCitationsListLengthEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UNKNOWN, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new UnknownCitationsListLengthEvent(bubbles, cancelable)
		}

	}
}