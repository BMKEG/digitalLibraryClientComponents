package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestCitationsListFilterChangeToAllEvent extends Event
	{
		public static const CHANGE:String = "UserRequestCitationsListFilterChangeToAllEvent";
		
		public function UserRequestCitationsListFilterChangeToAllEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGE, bubbles, cancelable);
		}

		override public function clone():Event
		{
			var event:UserRequestCitationsListFilterChangeToAllEvent = 
				new UserRequestCitationsListFilterChangeToAllEvent(bubbles, cancelable);

			return event; 
		}

	}
}