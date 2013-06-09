package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestCorpusEditorEvent extends Event
	{
		public static const OPEN:String = "UserRequestCorpusEditorEventOpen";
		public static const CLOSE:String = "UserRequestCorpusEditorEventClose";
		
		public var corpusId:int;
		
		/**
		 * When event type == OPEN then corpusId is the requested bmkegId of the corpus to be edited.
		 * If corpusId == -1 then it will edit a new corpus.
		 */
		public function UserRequestCorpusEditorEvent(type:String, corpusId:int=-1, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.corpusId = corpusId;
		}

		override public function clone():Event
		{
			return new UserRequestCorpusEditorEvent(type,corpusId, bubbles, cancelable);
		}

	}
}