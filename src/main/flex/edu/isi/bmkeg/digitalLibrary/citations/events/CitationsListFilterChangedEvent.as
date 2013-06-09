package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import flash.events.Event;
	
	public class CitationsListFilterChangedEvent extends Event
	{
		public static const CHANGED:String = "CorporaFilterChangedEvent";

		public function CitationsListFilterChangedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGED, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new CitationsListFilterChangedEvent(bubbles, cancelable)
		}

	}
}