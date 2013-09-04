package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;

	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;

	import flash.events.Event;
	
	public class ListArticleCitationPagedCommand extends Command
	{
	
		[Inject]
		public var event:ListArticleCitationPagedEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		[Inject]
		public var service:IDigitalLibraryService;
				
		override public function execute():void
		{
			model.queryLiteratureCitation = event.object;	

			service.listArticleCitationPaged(event.object, event.offset, event.cnt);
			
		}
		
	}
	
}