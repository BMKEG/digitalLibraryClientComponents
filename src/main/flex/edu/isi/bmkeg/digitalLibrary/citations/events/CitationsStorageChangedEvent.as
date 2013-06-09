package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import flash.events.Event;
	
	public class CitationsStorageChangedEvent extends Event
	{
		public static const CHANGED:String = "CitationsStorageChangedEvent";

		public function CitationsStorageChangedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGED, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new CitationsStorageChangedEvent(bubbles, cancelable)
		}

	}
}