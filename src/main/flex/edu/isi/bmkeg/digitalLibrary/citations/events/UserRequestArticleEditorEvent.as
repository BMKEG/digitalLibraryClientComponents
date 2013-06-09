package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestArticleEditorEvent extends Event
	{
		public static const OPEN:String = "UserRequestArticleEditorEventOpen";
		public static const CLOSE:String = "UserRequestArticleEditorEventClose";
		
		public var vpdmfId:int;
		
		/**
		 * When event type == OPEN then vpdmfId is the requested vpdmfId of the Article to be edited.
		 * If vpdmfId == -1 then it will edit a new Article.
		 */
		public function UserRequestArticleEditorEvent(type:String, vpdmfId:int=-1, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.vpdmfId = vpdmfId;
		}

		override public function clone():Event
		{
			return new UserRequestArticleEditorEvent(type,vpdmfId, bubbles, cancelable);
		}

	}
}