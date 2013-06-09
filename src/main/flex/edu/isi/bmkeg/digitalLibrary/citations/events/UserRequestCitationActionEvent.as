package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.LiteratureCitation;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class UserRequestCitationActionEvent extends Event
	{
		public static const OPEN_DOC:String = "UserRequestCitationActionOpenDoc";
		public static const EDIT:String = "UserRequestCitationActionEdit";
		
		public var citation:LiteratureCitation;
		
		public function UserRequestCitationActionEvent(type:String, citation:LiteratureCitation, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.citation = citation;
		}

		override public function clone():Event
		{
			return new UserRequestCitationActionEvent(type,citation, bubbles, cancelable);
		}

	}
}