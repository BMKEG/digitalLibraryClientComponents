package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestSaveCorpusEvent extends Event
	{
		public static const SAVE:String = "UserRequestSaveCorpusEvent";
		
		public var corpus:Corpus;
		
		public function UserRequestSaveCorpusEvent(corpus:Corpus, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SAVE, bubbles, cancelable);
			this.corpus = corpus;
		}

		override public function clone():Event
		{
			var event:UserRequestSaveCorpusEvent = 
				new UserRequestSaveCorpusEvent(corpus, bubbles, cancelable);

			return event; 
		}

	}
}