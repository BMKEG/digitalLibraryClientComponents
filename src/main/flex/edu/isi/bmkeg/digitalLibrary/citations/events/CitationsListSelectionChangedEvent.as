package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flash.events.Event;
	
	public class CitationsListSelectionChangedEvent extends Event
	{
		public static const CHANGED:String = "CitationsListSelectionChangedEvent";

		/**
		 * selected Article or null if none is selected
		 */
		public var selectedIndex:int;
		
		public function CitationsListSelectionChangedEvent(selectedIndex:int, 
												 bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGED, bubbles, cancelable);
			this.selectedIndex = selectedIndex;
		}

		override public function clone():Event
		{
			return new CitationsListSelectionChangedEvent(selectedIndex, bubbles, cancelable)
		}

	}
}