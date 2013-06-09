package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ArticleCitationRetrievedEvent extends Event
	{
		public static const ARTICLE_RETRIEVED:String = "ArticleCitationRetrievedEvent";
		
		public var article:ArticleCitation;
		
		public function ArticleCitationRetrievedEvent(article:ArticleCitation, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(ARTICLE_RETRIEVED, bubbles, cancelable);
			this.article = article;
		}

		override public function clone():Event
		{
			var event:ArticleCitationRetrievedEvent = 
				new ArticleCitationRetrievedEvent(article, bubbles, cancelable);

			return event; 
		}

	}
}