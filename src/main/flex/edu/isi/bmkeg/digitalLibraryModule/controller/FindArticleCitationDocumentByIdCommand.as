package edu.isi.bmkeg.digitalLibraryModule.controller
{
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationDocumentByIdEvent;
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	
	public class FindArticleCitationDocumentByIdCommand extends Command
	{
		[Inject]
		public var event:FindArticleCitationDocumentByIdEvent;
		
		[Inject]
		public var service:IDigitalLibraryService;
		
		override public function execute():void {
			service.findArticleCitationDocumentById( event.id );	
		}
		
	}
}