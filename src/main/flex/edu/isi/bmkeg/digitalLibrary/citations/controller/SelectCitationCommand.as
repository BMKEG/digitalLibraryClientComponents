package edu.isi.bmkeg.digitalLibrary.citations.controller
{	
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCitationsListSelectionChangeEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class SelectCitationCommand extends Command
	{
		
		[Inject]
		public var citationsListModel:CitationsListModel;
		
		[Inject]
		public var event:UserRequestCitationsListSelectionChangeEvent;
		
		override public function execute():void
		{
			citationsListModel.selectedIndex = event.selectedIndex;	
		}
	}
}