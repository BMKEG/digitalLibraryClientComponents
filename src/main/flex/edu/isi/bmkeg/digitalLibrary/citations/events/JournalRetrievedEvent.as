package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class JournalRetrievedEvent extends Event
	{
		public static const JOURNAL_RETRIEVED:String = "JournalRetrievedEvent";
		
		public var journal:Journal;
		
		public function JournalRetrievedEvent(journal:Journal, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(JOURNAL_RETRIEVED, bubbles, cancelable);
			this.journal = journal;
		}

		override public function clone():Event
		{
			var event:JournalRetrievedEvent = 
				new JournalRetrievedEvent(journal, bubbles, cancelable);

			return event; 
		}

	}
}