package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class RetrieveArticleCitationCommand extends Command
	{
		
		[Inject]
		public var citationsService:ICitationsService;
		
		[Inject]
		public var event:UserRequestRetrieveArticleEvent;
		
		override public function execute():void
		{
			citationsService.retrieveArticle(event.bmkegId)
		}
	}
}