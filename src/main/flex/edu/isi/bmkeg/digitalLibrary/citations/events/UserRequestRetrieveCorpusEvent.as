package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestRetrieveCorpusEvent extends Event
	{
		public static const RETRIEVE:String = "UserRequestRetrieveCorpusEvent";
		
		public var corpusId:int;
		
		public function UserRequestRetrieveCorpusEvent(corpusId:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(RETRIEVE, bubbles, cancelable);
			this.corpusId = corpusId;
		}

		override public function clone():Event
		{
			var event:UserRequestRetrieveCorpusEvent = 
				new UserRequestRetrieveCorpusEvent(corpusId, bubbles, cancelable);

			return event; 
		}

	}
}