package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class AddArticleCitationToCorpusEvent extends Event 
	{
		
		public static const ADD_ARTICLE_CITATION_TO_CORPUS:String = "addArticleCitationToCorpus";
		
		public var articleId:Number;
		public var corpusId:Number;
		
		public function AddArticleCitationToCorpusEvent(articleId:Number, corpusId:Number)
		{
			this.articleId = articleId;
			this.corpusId = corpusId;
			super(ADD_ARTICLE_CITATION_TO_CORPUS);
		}
		
		override public function clone() : Event
		{
			return new AddArticleCitationToCorpusEvent(articleId, corpusId);
		}
		
	}
	
}
