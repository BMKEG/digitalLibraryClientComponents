package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitializeCitationsListCommand extends Command
	{
		
		[Inject]
		public var model:CitationsListModel;
		
		override public function execute():void
		{
			model.initCitationsList();
		}
	}
}