package edu.isi.bmkeg.digitalLibrary.citations.controller
{	
	import edu.isi.bmkeg.digitalLibrary.citations.model.CitationsListFilterModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class SetCitationsListFilterToAllCommand extends Command
	{
		
		[Inject]
		public var citationsListFilterModel:CitationsListFilterModel;
		
		override public function execute():void
		{
			citationsListFilterModel.setFilterToAll();	
		}
	}
}