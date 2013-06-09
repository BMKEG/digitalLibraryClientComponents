package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestCitationsListFilterChangeToCorpusEvent extends Event
	{
		public static const CHANGE:String = "UserRequestCitationsListFilterChangeToCorpusEvent";
		
		public var corpusName:String;
		
		public function UserRequestCitationsListFilterChangeToCorpusEvent(corpusName:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGE, bubbles, cancelable);
			this.corpusName = corpusName;
		}

		override public function clone():Event
		{
			var event:UserRequestCitationsListFilterChangeToCorpusEvent = 
				new UserRequestCitationsListFilterChangeToCorpusEvent(corpusName, bubbles, cancelable);

			return event; 
		}

	}
}