package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class AddArticleCitationToCorpusResultEvent extends Event 
	{
		
		public static const ADD_ARTICLE_CITATION_TO_CORPUS_RESULT:String = "addArticleCitationToCorpusResult";
		
		public var success:Boolean;
		
		public function AddArticleCitationToCorpusResultEvent(success:Boolean)
		{
			this.success = success;
			super(ADD_ARTICLE_CITATION_TO_CORPUS_RESULT);
		}
		
		override public function clone() : Event
		{
			return new AddArticleCitationToCorpusResultEvent(success);
		}
		
	}
	
}