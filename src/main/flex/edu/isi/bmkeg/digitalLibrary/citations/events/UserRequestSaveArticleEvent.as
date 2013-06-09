package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestSaveArticleEvent extends Event
	{
		public static const SAVE:String = "UserRequestSaveArticleEvent";
		
		public var article:ArticleCitation;
		
		public function UserRequestSaveArticleEvent(article:ArticleCitation, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SAVE, bubbles, cancelable);
			this.article = article;
		}

		override public function clone():Event
		{
			var event:UserRequestSaveArticleEvent = 
				new UserRequestSaveArticleEvent(article, bubbles, cancelable);

			return event; 
		}

	}
}