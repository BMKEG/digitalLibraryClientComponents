package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestRetrieveJournalEvent extends Event
	{
		public static const RETRIEVE:String = "UserRequestRetrieveJournalEvent";
		
		public var journalAbbr:String;
		
		public function UserRequestRetrieveJournalEvent(journalAbbr:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(RETRIEVE, bubbles, cancelable);
			this.journalAbbr = journalAbbr;
		}

		override public function clone():Event
		{
			var event:UserRequestRetrieveJournalEvent = 
				new UserRequestRetrieveJournalEvent(journalAbbr, bubbles, cancelable);

			return event; 
		}

	}
}