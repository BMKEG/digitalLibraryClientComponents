package edu.isi.bmkeg.digitalLibrary.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RemoveArticleCitationFromCorpusEvent extends Event 
	{
		
		public static const REMOVE_ARTICLE_CITATION_FROM_CORPUS:String = "removeArticleCitationFromCorpus";
		
		public var articleId:Number;
		public var corpusId:Number;
		
		public function RemoveArticleCitationFromCorpusEvent(articleId:Number, corpusId:Number)
		{
			this.articleId = articleId;
			this.corpusId = corpusId;
			super(REMOVE_ARTICLE_CITATION_FROM_CORPUS);
		}
		
		override public function clone() : Event
		{
			return new RemoveArticleCitationFromCorpusEvent(articleId, corpusId);
		}
		
	}
	
}