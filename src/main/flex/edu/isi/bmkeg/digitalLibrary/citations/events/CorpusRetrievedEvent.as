package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class CorpusRetrievedEvent extends Event
	{
		public static const CORPUS_RETRIEVED:String = "CorpusRetrievedEvent";
		
		public var corpus:Corpus;
		
		public function CorpusRetrievedEvent(corpus:Corpus, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CORPUS_RETRIEVED, bubbles, cancelable);
			this.corpus = corpus;
		}

		override public function clone():Event
		{
			var event:CorpusRetrievedEvent = 
				new CorpusRetrievedEvent(corpus, bubbles, cancelable);

			return event; 
		}

	}
}