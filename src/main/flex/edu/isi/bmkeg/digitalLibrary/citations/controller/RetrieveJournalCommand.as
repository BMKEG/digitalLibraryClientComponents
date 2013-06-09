package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveJournalEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class RetrieveJournalCommand extends Command
	{
		
		[Inject]
		public var citationsService:ICitationsService;
		
		[Inject]
		public var event:UserRequestRetrieveJournalEvent;
		
		override public function execute():void
		{
			citationsService.retrieveJournalByAbbr(event.journalAbbr);
		}
	}
}