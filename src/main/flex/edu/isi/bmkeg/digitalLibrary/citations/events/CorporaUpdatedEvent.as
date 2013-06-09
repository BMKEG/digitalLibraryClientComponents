package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class CorporaUpdatedEvent extends Event
	{
		public static const UPDATED:String = "CorporaUpdatedEvent";
		
		public function CorporaUpdatedEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UPDATED, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new CorporaUpdatedEvent(bubbles, cancelable)
		}

	}
}