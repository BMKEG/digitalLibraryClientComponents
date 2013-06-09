package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestCitationsListSelectionChangeEvent extends Event
	{
		public static const CHANGE:String = "UserRequestCitationsListSelectionChangeEvent";
		
		/**
		 * The bmkegId if the selected citation or -1 if none is selected
		 */
		public var selectedIndex:int;
		
		public function UserRequestCitationsListSelectionChangeEvent(selectedIndex:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGE, bubbles, cancelable);
			this.selectedIndex = selectedIndex;
		}

		override public function clone():Event
		{
			var event:UserRequestCitationsListSelectionChangeEvent = 
				new UserRequestCitationsListSelectionChangeEvent(selectedIndex, bubbles, cancelable);

			return event; 
		}

	}
}