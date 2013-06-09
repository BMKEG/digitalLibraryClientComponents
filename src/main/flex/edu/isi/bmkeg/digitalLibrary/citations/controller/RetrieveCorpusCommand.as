package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICorporaService;
	
	import org.robotlegs.mvcs.Command;
	
	public class RetrieveCorpusCommand extends Command
	{
		
		[Inject]
		public var corporaService:ICorporaService;
		
		[Inject]
		public var event:UserRequestRetrieveCorpusEvent;
		
		override public function execute():void
		{
			corporaService.retrieveCorpus(event.corpusId)
		}
	}
}