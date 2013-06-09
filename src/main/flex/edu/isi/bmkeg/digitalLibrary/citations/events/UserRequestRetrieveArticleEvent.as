package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestRetrieveArticleEvent extends Event
	{
		public static const RETRIEVE:String = "UserRequestRetrieveArticleEvent";
		
		public var bmkegId:int;
		
		public function UserRequestRetrieveArticleEvent(bmkegId:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(RETRIEVE, bubbles, cancelable);
			this.bmkegId = bmkegId;
		}

		override public function clone():Event
		{
			var event:UserRequestRetrieveArticleEvent = 
				new UserRequestRetrieveArticleEvent(bmkegId, bubbles, cancelable);

			return event; 
		}

	}
}