package edu.isi.bmkeg.digitalLibraryModule.controller
{
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationDocumentByIdResultEvent;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;

	import org.robotlegs.mvcs.Command;
	
	public class FindArticleCitationDocumentByIdResultCommand extends Command
	{
		[Inject]
		public var event:FindArticleCitationDocumentByIdResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function execute():void {
			
			model.currentCitation = event.object;
			
		}
		
	}
	
}