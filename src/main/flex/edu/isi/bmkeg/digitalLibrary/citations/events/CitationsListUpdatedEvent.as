package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class CitationsListUpdatedEvent extends Event
	{
		public static const UPDATED:String = "CitationsListUpdatedEvent";
		
		public function CitationsListUpdatedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UPDATED, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new CitationsListUpdatedEvent(bubbles, cancelable)
		}

	}
}